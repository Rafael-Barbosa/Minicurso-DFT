
set terminal postscript eps color enhanced font "Times-Roman, 20"
set output "Graphene_dos.ps"
fermi=-1.1925
ymin=0
ymax=3
xmin=-15
xmax=10
set border linewidth 2.0
set style arrow 2 nohead lw 1
set style arrow 1 nohead ls 5 lc rgb "blue" lw 1.5
set arrow arrowstyle 2 from 0,ymin to 0,ymax as 1
set ylabel "Density of  states"
set xlabel "Energy (eV)"
plot [xmin:xmax][ymin:ymax] "graphene.dos" u ($1-fermi):2 with lines lc 8 lw 2 notitle

