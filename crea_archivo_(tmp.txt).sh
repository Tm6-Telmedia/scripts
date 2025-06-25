cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/
mv index.shtml index.bkp
find . \( -iname "index.shtml" -o -iname "index.htm" -o -iname "tmp.txt" \) -exec rm -f {} \;
mv index.bkp index.shtml
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/


rm -rf tmp.txt

find productos/ -type d -not -name 'img' -not  -name 'img2' -not -name 'thumb'  -not -name 'brochure'  -not -name 'categorias' -not -name 'js'  >tmp.txt #---> buscando  directorios
no_lineas=$(cat tmp.txt | wc -l)
#cat tmp.txt
let contador=2
echo $no_lineas
ls -l tmp.txt
while [ $contador -le $no_lineas ] #---> ciclo para moverse entre los diferentes directorios
do
	ruta=$(sed -n "$contador"p tmp.txt) #---> Obteniedo el directorio del documento
	ruta2=$(echo '"'$ruta'"')  #---> Agregando comillas a la variable del directorio
	eval cd $ruta2  #---> Moviendose al directorio 
	echo "Ruta: " $(pwd)
	echo "Directorios: " $(find  -mindepth 1 -maxdepth 1 -type d -printf '%f\n')
	x=$(find  -mindepth 1 -maxdepth 1 -type f -name "*.html" | wc -l )
	echo $x
	if [ $x -gt 0 ]
		then
	
			echo "-------------NO-----------------"

	else 
		z=$(find . -maxdepth 1 -mindepth 1 -type d | wc -l)
		if [ $z -ge 1 ]
		then 
			if [ -d "./switches" ]
			then 
				echo "El directorio existe"
				archivo=$(find switches/ -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp $archivo tmp.txt
			elif [ -d "./puntos de acceso" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'puntos de acceso/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			elif [ -d "./camaras de red" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'camaras de red/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			elif [ -d "./multimodo" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'multimodo/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			elif [ -d "./monomodo" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'monomodo/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			elif [ -d "./fibra optica" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'fibra optica/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			elif [ -d "./cableado UTP" ]
			then 
				echo "El directorio existe"
				archivo=$(find 'cableado UTP/' -iname *.html -print | head -n 1)
				#grep "xzoom-default" "$archivo"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g > tmp.html
				cp "$archivo" tmp.txt
				echo "------------------------------"
			else 
				echo "El directorio no existe"
				pwd
				directorio=$( find . -mindepth 1 -type d -print0 | head -z -n 1 | xargs -0 basename)
				archivo=$(find "$directorio" -iname *.html -print | head -n 1)
				cp "$archivo" tmp.txt
				echo "------------------------------"
			fi
			else 
				echo ""
			fi

	fi
	
	
	let contador=$contador+1
	cd /cygdrive/c/inetpub/Telmedia/Desarrollo/
	done  
	
	
