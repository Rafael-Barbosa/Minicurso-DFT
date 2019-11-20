#!/bin/sh
# reminder: from now on, what follows the character # is a comment


# delete the si.etot_vs_ecut if it exists
rm -f al.etot_vs_ecut

# loop over ecutwfc value
for ecut in 12 16 20 24 28 32 36 40 44 48 52 58 60
do
    echo "Running for ecutwfc = $ecut ..."

    # self-consistent calculation
    cat > Al.scf.in << EOF
    
&CONTROL
    prefix = 'al'

    outdir = '.'
    pseudo_dir = '../pseudo',
 /

 &SYSTEM    
    ibrav =  2,
    celldm(1) = 7.50,
    nat =  1,
    ntyp = 1,
    ecutwfc = $ecut, 

    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.06
 /

 &ELECTRONS
 /

ATOMIC_SPECIES
   Al  26.98 Al.pz-vbc.UPF
   
ATOMIC_POSITIONS alat
   Al 0.00 0.00 0.00
   
K_POINTS automatic
   6 6 6 1 1 1

    
EOF

    # run the pw.x calculation
    pw.x -in Al.scf.in > Al.scf.out

    # collect the ecutwfc and total-energy from the pw.si.scf.out output-file
    
    grep -e 'kinetic-energy cutoff' -e ! Al.scf.out | \
        awk '/kinetic-energy/ {ecut=$(NF-1)}
             /!/              {print ecut, $(NF-1)}' >> al.etot_vs_ecut

done

# plot the result

gnuplot plot-ecutwfc.gp
