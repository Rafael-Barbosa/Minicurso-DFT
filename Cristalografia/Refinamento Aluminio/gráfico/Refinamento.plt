set output "Refinamento.tex"
set terminal tikz fulldoc size 14cm,8cm fontscale 0.8
set sample 1000

set ylabel "Intensity (a.u.)"
set xlabel "$2\\theta (^{\\circ})$"

set xrange [35:140]
set yrange [-1500:7900]
unset ytics 
set format y ""
set xtics 10 out nomirror 
set key center at graph 0.20, 0.78 Left reverse sample 2.0 \
    spacing 2


set style line 1 lt 6 lc rgb "#FF4500"
set style line 2 lt 1 lc rgb "#000000" lw 2
set style line 3 lt 1 lc rgb "#000080" lw 1


set multiplot

plot "al.pl1"  using 1:2 ls 1  title "Obs" , '' using 1:3 w l ls 2  title "Calc", '' using 1:($4+460) w l ls 3  title "(Obs - Calc)", "al.pl2" using 1:($2-300)  linetype -1 pointtype "|" tc rgb "#E32636" title "$x = 0.5$" 

set size 0.45,0.45
set origin 0.54,0.545
#Fazendo o ZOOM!!
set xrange [35:50]
set yrange [0:7900]
set xtics 1 out nomirror
unset ylabel
set format y ""

plot "al.pl1"  using 1:2 ls 1  notitle, '' using 1:3 w l ls 2  notitle


unset multiplot
