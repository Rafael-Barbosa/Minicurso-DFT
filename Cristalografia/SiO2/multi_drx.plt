set output "mudrx.tex"
set terminal tikz fulldoc size 14cm,8cm fontscale 0.8
set sample 1000

dat1 = 'quartzo_po.dat'       #Entrada dos dados de difração de raios-X
dat2 = 'vidro.dat'            #Entrada dos dados de difração de raios-X 

titulo1 = "Quartzo ($SiO_2$)" #Entrada dos dados de difração de raios-X
titulo2 = "Silica ($SiO_2$)"  #Entrada dos dados de difração de raios-X



set multiplot layout 2,1 title "  " font ",12"  #Função multiplas plotagens 

unset title					#Não colocar título em cima dos gráficos		
set style data boxes				#Definir estilo dos gráficos	
set yrange [0 : 20000]				#Intervalo do eixo y para o primeiro plot
set xrange [10:62]				#Intervalo do eixo x para o primeiro plot
set xtics nomirror				#Não espelhar os tics no eixo y (colocar tics somente no eixo de baixo
set tics scale 0.2				#Configurar o tamanho dos tics		
unset ytics              			#Não mostrar os tics do eixo y				
set style line 1 lw 1 lc rgb "#000000"  	#Configurar a linha do plot (lw = espessura) (lc = cor)


plot dat1 using 1:($2+100)  w l ls 1  title titulo1		#Primeiro plot 	

set yrange [0 : 3000] 							#Intervalo do eixo y para o segundo plot


plot dat2 using 1:($2+100)  w l ls 1  title titulo2		#Segundo plot	

unset multiplot								#finalizando a funlçao de multiplas plotagens
