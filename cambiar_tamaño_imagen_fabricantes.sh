#!/bin/bash
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/fabricantes/
x=$(find *.png *.jpg)
array=($x)

for i in "${array[@]}"
	do
	#variables
	let w=$(magick identify -format %w $i)
	let h=$(magick identify -format %h $i)
	medidas_original=$(echo $w"x"$h) 
	#echo $medidas
	medidas=$(echo "400x400")
	echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
	echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" 
	magick convert  -background white -flatten -gravity center -extent $medidas $i  $i 
	#magick  -size 1600x1600 %nombre% -thumbnail 1600x1600^ -gravity center -extent 1600x1600 +profile "*" %nombre% 
	#echo $i "->" $resultado >> info.txt

	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
