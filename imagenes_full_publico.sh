#!/bin/bash
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img
x=$(find *.png *.jpg *.jpeg -mmin -5 )
total=$( find *.png *.jpg *.jpeg -mmin -5| wc -l)
array=($x)


#funcion mascara de agua
agregar_marca_agua() {
    cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img
    x=$(find . \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) ! -name "telmedia_0.png" -mmin -2 )
    array=($x)
    tmp=tmp.png

  
        medidas=$(echo "$w"x"$h")

            if [[ $w -lt 300 ]]; then
                echo -e "Agragando marca de agua"
                magick -size 1080x1080 c://inetpub/Telmedia/scripts/icon/icon.png -thumbnail $medidas^ -gravity center -extent $medidas +profile "*" $tmp
                magick composite -dissolve 20 -gravity Center "$tmp" "$i" "$i"
            else
                 echo -e "Agragando marca de agua"
                magick -size 1080x1080 c://inetpub/Telmedia/scripts/icon/icon.png -thumbnail $medidas^ -gravity center -extent $medidas +profile "*" $tmp
                magick "$i" c://inetpub/Telmedia/scripts/icon/icon1.png -gravity southeast -geometry +10+10 -composite "$i"
                magick composite -dissolve 20 -gravity Center "$tmp" "$i" "$i"
            fi

            # Agregando etiqueta oculta a la imagen para identificar que contiene mascara de agua 
            #magick "$i" -set "comment" "Watermarked" "$i"

            rm -R "$tmp"
       
}

#funcion imagenes cuadradas
imagenes_cuadradas() {
	if [[ $w -le 600 ]]
		then
			medidas=$(echo "600x600")
			echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
			echo "Haciendo imagen cuadrada" 
			#magick  -size $medidas $i -thumbnail $medidas -gravity center -extent $medidas +profile "*" $i 
			magick convert  -background white -flatten -gravity center -extent $medidas $i  $i 
			#agregar_marca_agua "$w" "$h" "$i"
		
		
		else
			if [[ $w -gt $h ]]
			then 
			medidas=$(echo $w"x"$w)
			echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
			echo "Haciendo imagen cuadrada" 
			#magick  -size $medidas $i -thumbnail $medidas -gravity center -extent $medidas +profile "*" $i 
			magick convert  -background white -flatten -gravity center -extent $medidas $i  $i
			#agregar_marca_agua  "$w" "$h" "$i"
		
				else
				medidas=$(echo $h"x"$h)
				echo "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
				echo "Haciendo imagen cuadrada" 
				#magick  -size $medidas $i -thumbnail $medidas -gravity center -extent $medidas +profile "*" $i 
				magick convert  -background white -flatten -gravity center -extent $medidas $i  $i
				#agregar_marca_agua  "$w" "$h" "$i"
		
				
		fi
	#magick  -size 1600x1600 %nombre% -thumbnail 1600x1600^ -gravity center -extent 1600x1600 +profile "*" %nombre% 
	#echo $i "->" $resultado >> info.txt
	fi

}

#funcion imagenes webp
imagenes_webp() {
	
	  
	 if [[ "$extension" == *"jpg"* ]]; then
		a=${i%.jpg}
		echo "Cambiando a formato webp "
		magick $i -quality 95 $a.webp	
		mv  $a.webp $a.jpg	
		fi
	 if [[ "$extension" == *"png"* ]]; then
		echo "Cambiando a formato webp"
		b=${i%.png}
		magick $i -quality 95 $b.webp		
		mv  $b.webp $b.png	
		fi

	 if [[ "$extension" == *"jpeg"* ]]; then
		echo "Cambiando a formato webp"
		c=${i%.jpeg}
		magick $i -quality 95 $c.webp		
		mv  $c.webp $c.jpeg	
		fi
	
	}
	
#funcion imagenes webp store
imagenes_webp_store() {
    
      
     if [[ "$extension" == *"jpg"* ]]; then
        a=${i%.jpg}
		echo "Cambiando a formato webp "
		imagenes_cuadradas "$w" "$h" "$i" "$medidas_original"
        magick $i -quality 95 $a.webp     
		mv /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img/$a.webp /cygdrive/c/inetpub/Telmedia/TM6/productos/img2/$a.webp 		
        fi
     if [[ "$extension" == *"png"* ]]; then
		echo "Cambiando a formato webp "
        b=${i%.png}
		
        magick $i -quality 95 $b.webp 
		mv /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img/$b.webp /cygdrive/c/inetpub/Telmedia/TM6/productos/img2/$b.webp 
		#rm -rf $i
        fi

     if [[ "$extension" == *"jpeg"* ]]; then
		echo "Cambiando a formato webp "
        c=${i%.jpeg}
		imagenes_cuadradas "$w" "$h" "$i" "$medidas_original"
		magick $i -quality 95 $c.webp 
        mv /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img/$c.webp /cygdrive/c/inetpub/Telmedia/TM6/productos/img2/$c.webp 
		#rm -rf $i
        fi
    
    }	
n=0
for i in "${array[@]}"
	do
	#variables
	
	let w=$(magick identify -format %w $i)
	let h=$(magick identify -format %h $i)
	medidas_original=$(echo $w"x"$h) 
	extension=$(echo $i | cut -d "." -f2)
	watermark=$( magick identify $i| cut -d " " -f2)
	echo $watermark
    if [[ "$watermark" == *"WEBP"* ]]; then
		
        echo -e "La imagen ya esta procesada: $i \n"
		echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
		n=$((n + 1))
		echo $n de $total
	else
		#Mandando a llamar las funciones
		echo -e "La imagen aun no ha sido procesada: $i \n"
		#Proceso imágenes en sitio público
		imagenes_cuadradas "$w" "$h" "$i" "$medidas_original"
		agregar_marca_agua "$w" "$h" "$i"
		imagenes_webp  "$extension" "$i"
		n=$((n + 1))
		echo $n de $total
		
		echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	fi
	done
	read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
