#!/bin/bash

cd /c/inetpub/Telmedia/Desarrollo/
rm -rf tmp.txt

find productos/ -type d -not -name 'img' -not  -name 'img2' -not -name 'thumb'  -not -name 'brochure'  -not -name 'categorias'  >tmp.txt #---> buscando  directorios
no_lineas=$(cat tmp.txt | wc -l)  #---> numéro de lineas en el documento de los directorios
let contador=2
echo $no_lineas

while [ $contador -le $no_lineas ] #---> ciclo para moverse entre los diferentes directorios
do
	ruta=$(sed -n "$contador"p tmp.txt) #---> Obteniedo el directorio del documento
	ruta2=$(echo '"'$ruta'"')  #---> Agregando comillas a la variable del directorio
	eval cd $ruta2  #---> Moviendose al directorio 
	pwd
	rm -rf index.shtml  index.htm #---> Eliminando menu anterios

	dir=$(pwd)
	x=$(pwd| cut -d "/" -f7- --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
	y=$( pwd| cut -d "/" -f6- --output-delimiter=$'/')
	z=$(pwd| cut -d "/" -f6-8 --output-delimiter=$'/')
	nodir=$( ls  -p | grep "/" | wc -l)
	nodir2=$(ls  -p | grep "/"| tr "/" "\n")
	
	#------------> Creando pate html del menu
	echo '<!DOCTYPE html>
	<html lang="en">
	<head> 
		<meta property="og:image" content=" http://tm6.telmedia.com.mx/tm/assets/img/icon1.png" />'>> index.htm
	echo '<meta property="og:title" content="Telmedia-Productos-'$x'" />'>> index.htm
	echo '<meta charset="UTF-8">'>> index.htm
	echo "<title>""Telmedia-Productos-"$x "</title>" >> index.htm
	echo '
	<link rel="stylesheet" href="/tm/assets/css/styles.css">
	</head>
	<body>
	<div class="page-wrap">
		  
		  <div class="page-header-wrap">
			<div class="container">
			  <div class="page-header">
	'>> index.htm
	echo "<h1>" $x "</h1>" >> index.htm
	echo '
	 </div> <!-- end page-header -->
			</div> <!-- end container -->
		  </div> <!-- end page-header-wrap -->'>> index.htm
	cd ..
	dir2=$(pwd |cut -d "/" -f6- --output-delimiter=$'/')
	cd "$dir"
	echo '<center><a href="'/$dir2/index.shtml'"class="ai ai-arrow-left ai-2x">' '</a></center>'>> index.htm
	echo '<div class="wrapper">
	 <div class="cards_wrap">' >> index.htm
	#------------> Creando primera parte del menu
	
	archivos=$(find *.shtml)
	array=($archivos)
	array2=($nodir2)

	if [[ $nodir > 0 ]]
	then

		for j in */
		do
			n=$(echo $j |cut -d "/" -f1- --output-delimiter=$' ' |sed -e "s/\b\(.\)/\u\1/g")
			n2=$(echo $j |cut -d "/" -f1- --output-delimiter=$'-')  
			
			case $n2 in  #---> Categorias menu
			redes-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Redes.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					

			seguridad-)
				echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Seguridad.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
			almacenamiento-)
				echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Almacenamiento.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
			cctv-)
				echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/CCTV.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
			computo-)
				echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Computo.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
			'cloud'-)
				echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Servicios Cloud.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
			'videoconferencia'-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Video Conferencias.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
				
			'cableado'-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/cableado.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
					
					'energia'-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/energia.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
					'genericos'-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/genericos.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
					
					'herramientas'-)
			echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/herramientas.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $n >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					;;
			*)
				 rm -rf "$j"/index.shtml  "$j"/index.htm
				 x=$(ls -p "$j"  | grep -v / )
				 z=$(echo $x |cut -d " " -f1 )
				 z=$(echo $j$z)
				 imagen=$(grep "myimage0" "$z" |cut -d " " -f6 | cut -d "/" -f4 | cut -d '"' -f1)
				 
				 if [ -z "$imagen" ]
					then
						fabricante=$(pwd | cut -d "/" -f7)
						imagen2=$(find /c/inetpub/Telmedia/Desarrollo/productos/categorias -type f -iname "*$fabricante*" | cut -d "/" -f8)
						echo '  <div class="card_item">
				  <div class="card_inner">
					<div class="card_top">' >> index.htm
					echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$imagen2'" src="/productos/categorias/'$imagen2'" alt="'$imagen2'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
					echo '   </div>
					<div class="card_bottom">
					  <div class="card_category"> ' >> index.htm
					  echo $n >>index.htm
					  echo '
					   </div>
					 
					</div>
				  </div>
				</div>'>>index.htm
					else
						 echo '  <div class="card_item">
				  <div class="card_inner">
					<div class="card_top">' >> index.htm
					echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$imagen'" src="/productos/thumb/'$imagen'" alt="'$imagen'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
					echo '   </div>
					<div class="card_bottom">
					  <div class="card_category"> ' >> index.htm
					  echo $n >>index.htm
					  echo '
					   </div>
					 
					</div>
				  </div>
				</div>'>>index.htm
					fi
			;;
			esac
			
		done

		for i in "${array[@]}"
		do
			nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
			b=${nombre%.shtml}
			c=${i%.shtml}
			icon=$(grep "myimage0" $c.html |cut -d " " -f6 | cut -d "/" -f4 | cut -d '"' -f1)
		echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$i'">' '<img image-id="'$b'" src="/productos/thumb/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $b >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
		
					
		done
	else 
		for i in "${array[@]}"
		do
			nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
			b=${nombre%.shtml}
			c=${i%.shtml}
			icon=$(grep "myimage0" $c.html |cut -d " " -f6 | cut -d "/" -f4 | cut -d '"' -f1)
		echo '  <div class="card_item">
		  <div class="card_inner">
			<div class="card_top">' >> index.htm
			echo '<a href="'/$y/$i'">' '<img image-id="'$b'" src="/productos/thumb/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			echo '   </div>
			<div class="card_bottom">
			  <div class="card_category"> ' >> index.htm
			  echo $b >>index.htm
			  echo '
			   </div>
			 
			</div>
		  </div>
		</div>'>>index.htm
					
		done
	fi


	echo '
	</div>
	</div>


	</body>
	</html>
	'>>index.htm


	echo '<!--#include virtual="/tm/pages/header.htm"-->
	<br>
	<!--#include file="index.htm"-->
	<br>
	<!--#include virtual="/tm/pages/footer.htm"-->' >> index.shtml
	#read -n1 -r -p "Index creado, pulsa cualquier tecla para salir..." key

let contador=$contador+1
cd /c/inetpub/Telmedia/Desarrollo/
done
cd /c/inetpub/Telmedia/Desarrollo/
rm -rf tmp.txt