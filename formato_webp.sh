#!/bin/bash
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img2

imagenes_jpg=$(find  *.jpg )
array_jpg=($imagenes_jpg)
imagenes_png=$(find  *.png)
array_png=($imagenes_png)
imagenes_jpeg=$(find  *.jpeg)
array_jpeg=($imagenes_jpeg)

for i in "${array_jpg[@]}"
	do
	
	a=${i%.jpg}
	echo $a
	echo "Cambiando a formato webp: "$i
	magick $i -quality 95 $a.webp	
	mv  $a.webp $a.jpg	
	done
for j in "${array_png[@]}"
	do
	echo "Cambiando a formato webp: "$i
	b=${j%.png}
	magick $j -quality 95 $b.webp		
	mv  $b.webp $b.png	
	done

for x in "${array_jpeg[@]}"
	do
	echo "Cambiando a formato webp: "$x
	c=${x%.jpeg}
	magick $x -quality 95 $c.webp		
	mv  $c.webp $c.jpeg	
	done
read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
