#!/bin/bash
cd /c/inetpub/Telmedia/Desarrollo/productos/img2
x=$(find *.png *.jpg)
array=($x)

for i in "${array[@]}"
	do
	#variables
	let w=$(magick identify -format %w $i)
	let h=$(magick identify -format %h $i)
	medidas_original=$(echo $w"x"$h) 
	x=$(python -c "print($w/$h),2")
	resultado=$(python -c "print(round($x,1))") 
	#echo $medidas
	
	if [[ $resultado > 1.4 ]]
		then
		if [[ $w -gt $h ]]
			then 
			medidas=$(echo $w"x"$w)
			echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
			echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" 
			magick  -size $medidas $i -thumbnail $medidas -gravity center -extent $medidas +profile "*" $i 
		
				else
				medidas=$(echo $h"x"$h)
				echo "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
				echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->"
				magick  -size $medidas $i -thumbnail $medidas -gravity center -extent $medidas +profile "*" $i 

				
		fi
	#magick  -size 1600x1600 %nombre% -thumbnail 1600x1600^ -gravity center -extent 1600x1600 +profile "*" %nombre% 
	#echo $i "->" $resultado >> info.txt
	fi
	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
