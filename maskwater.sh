#!/bin/bash
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img2
#x=$(find *.png *.jpg *.jpeg)
x=$(find . \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) ! -name "telmedia_0.png")
array=($x)
tmp=tmp.png
for i in "${array[@]}"
	do
	#variables
	let w=$(magick identify -format %w $i)
	h=$(magick identify -format %h $i)
	medidas=$(echo $w"x"$h) 

	if [[ $w -lt 300 ]]
	then 
		echo "Agregando mascara de agua a: "$i
		magick  -size 1080x1080 c://inetpub/Telmedia/scripts/icon/icon.png -thumbnail $medidas^ -gravity center -extent $medidas +profile "*" $tmp
		magick  composite  -dissolve 20 -gravity Center $tmp  $i  $i
	else
		magick  -size 1080x1080 c://inetpub/Telmedia/scripts/icon/icon.png -thumbnail $medidas^ -gravity center -extent $medidas +profile "*" $tmp
		magick $i c://inetpub/Telmedia/scripts/icon/icon1.png   -gravity southeast -geometry +10+10 -composite  $i
		magick  composite  -dissolve 20 -gravity Center $tmp  $i  $i
		echo "Agregando mascara de agua a: "$i

	#echo $medidas
	rm -R "$tmp"
	fi
	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key