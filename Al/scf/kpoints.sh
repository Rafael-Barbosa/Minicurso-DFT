#!/bin/sh
# reminder: from now on, what follows the character # is a comment


# delete the al.kpoints_vs_etot if it exists
rm -f al.etot_vs_kpoints

# loop over kpoitns
for k in 2 4 6 8 10 12 14 16
do
    echo "Running for kpoitns = $k ..."

    # self-consistent calculation
    cat > Al.scf.in << EOF
    
&CONTROL
    calculation = 'scf',
    prefix = 'al'
    ! $k
    outdir = '.'
    pseudo_dir = '../pseudo',
 /

 &SYSTEM    
    ibrav =  2,
    celldm(1) = 7.50,
    nat =  1,
    ntyp = 1,
    ecutwfc = 40, 
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.06
 /

 &ELECTRONS
    mixing_beta = 0.7 
 /

ATOMIC_SPECIES
   Al  26.98 Al.pz-vbc.UPF
   
ATOMIC_POSITIONS alat
   Al 0.00 0.00 0.00
   
K_POINTS automatic
   $k $k $k 1 1 1

    
EOF

    # run the pw.x calculation
    pw.x -in Al.scf.in > Al.scf.out

    # collect the kpoints and total-energy from the pw.si.scf.out output-file
    
    grep -e ! Al.scf.in -e ! Al.scf.out | awk '/Al.scf.in/ {k=$3} /Al.scf.out/ {print k,$5}' >> al.etot_vs_kpoints

done

# plot the result

gnuplot plot-kpoints.gp
