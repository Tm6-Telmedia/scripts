#!/bin/bash

cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img
#-newermt 2023-07-08 ! -newermt 2023-07-09
total=$( find *.png *.jpg -mmin -5|wc -l)
x=$(find *.png *.jpg *.jpeg -mmin -5)
#total=$( find *.webp| wc -l)
#x=$(find *.webp)
array=($x)


#

#funcion imagenes cuadradas
imagenes_cuadradas() {
    if [[ $w -le 600 ]]
        then
            medidas=$(echo "600x600")
            echo $i "Medida original" $medidas_original "Medida nueva" $medidas "->" $resultado >> info.txt
            echo "Haciendo imagen cuadrada: "$i "Medida original" $medidas_original "Medida nueva" $medidas "->" 
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
		magick $i -quality 95 $c.webp 
        mv /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/img/$c.webp /cygdrive/c/inetpub/Telmedia/TM6/productos/img2/$c.webp 
		#rm -rf $i
        fi
    
    }

n=0
for i in "${array[@]}"; do
    #variables
	let w=$(magick identify -format %w $i)
    let h=$(magick identify -format %h $i)
    medidas_original=$(echo $w"x"$h) 
    extension=$(echo $i | cut -d "." -f2)
    
	#if para determinar si la imagen ya fue procesada
    if  grep -q "^$i$" "imagenes_full_store.txt"; then
        echo -e "La imagen ya esta procesada: $i \n"
		echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
		n=$((n + 1))
		echo $n de $total
    else
		echo -e "La imagen no ha sido procesada: $i comenzando proceso... \n"
		imagenes_cuadradas "$w" "$h" "$i" "$medidas_original"
		imagenes_webp  "$extension" "$i"
		echo $i >> imagenes_full_store.txt 
		n=$((n + 1))
		echo $n de $total
		echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"		
    fi

    # Resto del procesamiento de la imagen...
    
    # Mandando a llamar las funciones


   
done

read -n1 -r -p "Imágenes actualizadas, pulsa cualquier tecla para salir..." key
