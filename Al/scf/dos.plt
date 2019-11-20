set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'dos.eps'

data = 'Al.dos.dat'

f(x) = a*sqrt(x+b)+y
a = 1
b = 1
y = 1

fit [-5:3]f(x) data u 1:2 via a,b,y

#Plot gráfico

set ylabel 'DOS'
set xlabel 'Energy [eV]'

set xtics nomirror; set ytics nomirror
set tics scale .75

set key right top
set key spacing 1.2

set style line 1 lt 1 lw 3 lc rgb '#003366' # blue
set style line 2 lt 1 lw 3 lc rgb '#dd4814' # orange
set style line 3 lt 1 lw 2 lc rgb '#edb120' # yellow
set style line 4 lt 1 lw 2 lc rgb '#77216f' # purple
set style line 5 lt 1 lw 2 lc rgb '#006633' # green
set style line 6 lt 1 lw 2 lc rgb '#4dbeee' # light-blue
set style line 7 lt 1 lw 2 lc rgb '#a2142f' # red

plot [-5:4] data u 1:2 title '' w p pt 1 lc rgb 'black' ps 0.2, \
		  f(x) title 'Sqrt(E)' w l ls 7
