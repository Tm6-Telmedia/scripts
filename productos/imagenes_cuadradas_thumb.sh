#!/bin/bash
cd ../productos/thumb2/
x=$(find *webp  )
total=$(find *.webp   | wc -l)
array=($x)
n=0

for i in "${array[@]}"
	do
	#variables
	let w=$(magick identify -format %w $i)
	let h=$(magick identify -format %h $i)

	medidas_original=$(echo $w"x"$h) 

	
 	if [[ $h -gt $w ]]
		then 
			echo "Procesando: " $i
			medidas=$(echo $h"x"$h)
			echo "Original "$medidas_original
			echo "Nuevo :"$medidas
			magick convert  -background white -flatten -gravity center -extent $medidas $i  $i
			n=$((n + 1))
			echo $n de $total
			echo "DESDE EL IF"
		
		else
			echo "Procesando: " $i
			medidas=$(echo $w"x"$w)
			echo "Original "$i":"$medidas_original
			echo "Nuevo "$i":"$medidas
			magick convert  -background white -flatten -gravity center -extent $medidas $i  $i
			n=$((n + 1))
			echo $n de $total
			
		
				
		fi
	#echo $medidas
	#W/h

	#W>h -> nada
	#h<w -> cuadrado al valor de lo alto 
	
	
	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
