#!/bin/bash
cd ../fabricantes/
x=$(find *.png *.jpg)
array=($x)

for i in "${array[@]}"
	do
	#variables
	let w=$(magick identify -format %w $i)
	let h=$(magick identify -format %h $i)
	medidas_original=$(echo $w"x"$h) 
	if [[ $w -eq 400 ]] &&  [[ $h -eq 400 ]]
		then
			echo "La imagen tiene el tamaño correcto" $i
		else
	        medidas=$(echo "400x400")
	        echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" 
            magick convert "$i" -resize 400x400 -background white -gravity center -extent 400x400 "$i"

			#convert $i -gravity center -background white -extent 900x900 -resize 400x400 $i
		fi
	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
