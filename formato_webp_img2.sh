#!/bin/bash
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img2

x=$(find  *.jpg *.jpeg)
array=($x)
y=$(find  *.png)
array2=($y)

for i in "${array[@]}"
	do
	
	a=${i%.jpg}
	echo "Cambiando a formato webp: "$i
	magick $i -quality 95 $a.webp
	rm -rf $i	
	
	done
for j in "${array2[@]}"
	do
	echo "Cambiando a formato webp: "$i
	b=${j%.png}
	magick $j -quality 95 $b.webp		
	rm -rf $j	
	done

read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
