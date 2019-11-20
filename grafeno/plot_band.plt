
set terminal postscript eps color enhanced font "Times-Roman, 20"
set output "Graphene_bands.ps"
ymin=-15
ymax=15
set border linewidth 2.0
set style arrow 2 nohead lw 1
set style arrow 1 nohead ls 5 lc rgb "blue" lw 1.5
set arrow arrowstyle 2 from 100,ymin to 100,ymax as 1
set arrow arrowstyle 2 from 132,ymin to 132,ymax as 1
set arrow from 1,0 to 230,0 nohead as 1
set ylabel "Energy (eV)"
set xtics ("{/Symbol G}" 1, "M" 100, "K" 132, "{/Symbol G}" 230)
plot [][ymin:ymax] "EnergyValues.txt" u 1:2 with lines lc 8 lw 2 notitle

