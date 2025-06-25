#!/bin/bash
cd /c/inetpub/Telmedia/Desarrollo/productos/thumb

x=$(find  *.jpg)
array=($x)
y=$(find  *.png)
array2=($y)

for i in "${array[@]}"
	do
		a=${i%.jpg}
		magick convert $i -fuzz 4% -fill none -draw "alpha 0,0 floodfill" -channel alpha -blur 0x1 -level 50x85% +channel $a.png
		rm -rf $i
		mv $a.png $a.jpg
		rm -rf $a.png
	
	done
for j in "${array2[@]}"
	do
		magick convert $j -fuzz 4% -fill none -draw "alpha 0,0 floodfill" -channel alpha -blur 0x1 -level 50x85% +channel $j
		
	
	done

read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
