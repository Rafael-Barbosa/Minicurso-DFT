#!/bin/bash
 

if [ "$#" != 1 ] ; then
	echo "Usage:"
	echo "      $(basename $0) <input.tikz>"
	exit 1
else
	INPUT=$1
#	JNAME=$2
fi 


if [ -f "$INPUT" ] ; then
	BASE=`basename $INPUT .plt`
	TEX=$(echo ""$BASE".tex")
	PDF=$(echo ""$BASE".pdf")
else
	echo "==> $INPUT não é um arquivo válido"
	exit 1
fi

vim $INPUT && gnuplot $INPUT

CONTROL=$(echo "$?")
if [ "$CONTROL" != 0 ] ; then
	echo "Erro no GNUPlot!" ; exit 1
fi 
CONTROL='1'

#sed -i 's/\\documentclass\[10pt\]{article}/\\documentclass[12pt]{article}/' "$TEX"
sed -i 's/\\usepackage\[utf8x\]{inputenc}/\\usepackage[utf8]{inputenc}/' "$TEX"
sed -i -e '2i\' -e '\\usepackage{amsmath,amssymb,amsthm}' "$TEX"
sed -i -e '2i\' -e '\\usepackage\[brazil,brazilian\]{babel}' "$TEX"
#sed -i -e '2i\' -e '\\usepackage\[brazil,brazilian\]{babel}' "$TEX"

lualatex -shell-escape "$TEX"
#rm  "$TEX" *.aux *.log
evince "$PDF"
 
exit 0
