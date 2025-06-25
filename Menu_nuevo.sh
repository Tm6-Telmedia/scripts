#!/bin/bash



cd /cygdrive/c/inetpub/Telmedia/Desarrollo/
find -iname "menu_tabla.txt" -exec rm -f {} \;
#find -iname "index.shtml" -exec rm -f {} \;

rm -rf tmp.txt



find productos/ -type d -not -name 'img' -not  -name 'img2' -not -name 'thumb' -not -name 'thumb2'  -not -name 'brochure'  -not -name 'categorias' -not -name 'js'  >tmp.txt #---> buscando  directorios

no_lineas=$(cat tmp.txt | wc -l)  #---> numéro de lineas en el documento de los directorios

let contador=2

echo $no_lineas



while [ $contador -le $no_lineas ] #---> ciclo para moverse entre los diferentes directorios

do

	ruta=$(sed -n "$contador"p tmp.txt) #---> Obteniedo el directorio del documento

	ruta2=$(echo '"'$ruta'"')  #---> Agregando comillas a la variable del directorio

	eval cd $ruta2  #---> Moviendose al directorio 

	pwd

	rm -rf index.shtml index.htm  #---> Eliminando menu anteriores



	dir=$(pwd)

	url_canonical=$(pwd| cut -d "/" -f7-)
	x=$(pwd| cut -d "/" -f8- --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
	y=$( pwd| cut -d "/" -f7- --output-delimiter=$'/')
	y2=$(echo $y | sed s?" "?"\&#32"?g)

	z=$(pwd| cut -d "/" -f7-9 --output-delimiter=$'/')

	nodir=$( ls  -p | grep "/" | wc -l)

	nodir2=$(ls  -p | grep "/"| tr "/" "\n")

	
		#creando la primera parte del menu en  tabla
				echo '<!--Inicio tabla productos -->
		<div class="wrapper" id="menu_tabla" style="display: none">
		  <div class="cards_wrap">
			  <div class="col-md-10" style=" margin-left: auto; margin-right: auto;">
			 <div class="panel panel-default">
			   <div class="panel-heading"  id="Lproductos">Lista de productos</div>
			   <div class="panel-heading" id="Lcategorias"style="display:none;">Lista de categorias</div>
			   <div class="panel-heading" id="Lambas"style="display:none;">Lista de categorias y productos</div>
			   <table id="myTable" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					 <tr>
					  <th></th>
					  <th id="celda1" >Nombre</th>
					  <th id="celda2" >Número de parte</th>
					  <th id="celda3" >SKU</th>
					  
					  <th id="celda4" style="display:none;">Categoria</th>
					  
					 </tr>
				</thead>   
				   <tbody>' >>menu_tabla.txt
	#------------> Creando parte html del menu

	echo '<!DOCTYPE html>

	<html lang="en">

	<head> 

		<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/tm/assets/img/icon1.png" />'>> index.htm

	echo '<meta property="og:title" content="Telmedia-Productos-'$x'" />'>> index.htm

	echo '<meta charset="UTF-8">'>> index.htm
	echo '<!--meta name="ss360" content="noindex" /--><script src="/productos/categorias/js/tipo_menu.js"></script><script src="/productos/categorias/js/tipo_producto.js"></script>' >> index.htm

	echo "<title>"$x "</title>" >> index.htm

	echo '

	<link rel="stylesheet" href="/tm/assets/css/styles.css">
	<link rel="canonical" href="https://telmedia.com.mx/'$url_canonical'"/>

	</head>
	
	<style>
	.category-header {
    font-weight: bold; /* Negritas */
    
    text-align: left; /* Alineación opcional */
    padding: 8px; /* Espaciado opcional */
}

	</style>

	<body>

	<div class="page-wrap">

		  

		  <div class="page-header-wrap">

			<div class="container">

			  <div class="page-header">
			  

	'>> index.htm
	#titulo de menu 
	x3=$(pwd| cut -d "/" -f8 --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
	let x2=$(pwd | cut -d "/" -f8-| wc -l  < <(grep -Eo '[/]'))
	let x2=$x2+8
	
	x2=$(pwd| cut -d "/" -f$x2 --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
		cd ..

	dir2=$(pwd |cut -d "/" -f7- --output-delimiter=$'/')
	echo "Flecha" $dir2 
	cd "$dir"

	if [[ $x3 = $x2 ]]
		then
					echo "<h1>" $x3"</h1>" '<h6><a href="'/$dir2'/index.shtml''"class="ai ai-arrow-left ai-lg">' '</a><!-- Tipo de menu (menu de opciones)-->&nbsp; &nbsp;<label for="disabledSelect" class="form-label">Vista</label>
                <select class="form-select" id="select1" onChange="categorias()">
				 <option value="value2" selected disabled>Elige una opción</option>
					<option value="mosaico" >Mosaico</option>
					<option value="tabla" >Tabla</option>
                </select> </h6>'' <div class="breadcrumb-wrap">
              <ol class="breadcrumb">
<li><a href="/productos">Catálogo</a></li> '>> index.htm 
		else
					echo "<h1>" $x3'-'$x2"</h1>" '<h6><a href="'/$dir2'/index.shtml''"class="ai ai-arrow-left ai-lg">' '</a><!-- Tipo de menu (menu de opciones)-->&nbsp; &nbsp;<label for="disabledSelect" class="form-label">Vista</label>
                <select class="form-select" id="select1" onChange="categorias()">
				 <option value="value2" selected disabled>Elige una opción</option>
					<option value="mosaico" >Mosaico</option>
					<option value="tabla" >Tabla</option>
                </select> </h6>'' <div class="breadcrumb-wrap">
              <ol class="breadcrumb">
<li><a href="/productos">Catálogo</a></li> '>> index.htm 
		fi

	#Creando navegación de la derecha (Ejemplo:Catalogo/Aruba/Redes )

	no_directorios_submenu=$(pwd | cut -d "/" -f7-| wc -l  < <(grep -Eo '[/]'))
	let no_directorios_submenu=$no_directorios_submenu+1
	let flag=1
	let f=8
	while [ $flag -lt $no_directorios_submenu ]
		do
		  ruta=$(pwd | cut -d "/" -f7-$f)
		  texto=$(pwd | cut -d "/" -f$f|sed -e "s/\b\(.\)/\u\1/g")
		  echo '<li><a href="/'$ruta''/index.shtml'">'$texto'</a></li>'>> index.htm 
		 
		  let flag=$flag+1
		  let f=$f+1
		done
	
 


echo '      </ol>
            </div> ' >> index.htm

	echo '

	 </div> <!-- end page-header -->

			</div> <!-- end container -->

		  </div> <!-- end page-header-wrap -->'>> index.htm




	echo '<div class="wrapper" id="menu_mosaico" style="display: none; padding: 0% 10%">

	 <div class="cards_wrap">' >> index.htm

	#------------> Creando primera parte del menu

	

	archivos=$(find *.html -not -name "temporal.html")

	array=($archivos)

	array2=($nodir2)



	if [[ $nodir > 0 ]]

	then



		for j in */

		do

			n=$(echo $j |cut -d "/" -f1- --output-delimiter=$' ' |sed -e "s/\b\(.\)/\u\1/g")

			n2=$(echo $j |cut -d "/" -f1- --output-delimiter=$'-')  
			j2=$(echo $j | sed s?" "?"\&#32"?g)
			

			case $n2 in  #---> Categorias menu

			redes-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Redes.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/Redes.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm

		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/Redes.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
		
			</tr>'>>menu_tabla.txt
					;;

					



			seguridad-)

				echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Seguridad.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/Seguridad.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/Seguridad.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
		
			</tr>'>>menu_tabla.txt

					;;

					

			almacenamiento-)

				echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Almacenamiento.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/Almacenamiento.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/Almacenamiento.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
		
			</tr>'>>menu_tabla.txt

					;;

					

			videovigilancia-)

				echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/CCTV.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/CCTV.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/CCTV.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
			
			</tr>'>>menu_tabla.txt
					;;

					

			"centro de datos"-)

				echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Computo.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/Computo.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/Computo.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
			
			</tr>'>>menu_tabla.txt
					;;

					

			'cloud'-)

				echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Servicios Cloud.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/Servicios Cloud.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/Servicios Cloud.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
			
			</tr>'>>menu_tabla.txt
					;;

					

			'videoconferencia'-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/video conferencias.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/video conferencias.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/video conferencias.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
			
			</tr>'>>menu_tabla.txt
					;;

					

				

			'cableado'-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/cableado.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >> index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/cableado.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/cableado.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>
			
			</tr>'>>menu_tabla.txt
					;;

					

					

					'energia'-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/energia.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/energia.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/energia.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>

			</tr>'>>menu_tabla.txt
					;;

					

					'genericos'-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/genericos.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/genericos.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/genericos.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>

			</tr>'>>menu_tabla.txt
					;;

					

					'herramientas'-)

			echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/herramientas.png" alt="'$n'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">
			<div class="card_info">
			  <div class="card_category"> ' >> index.htm

			  echo $n >>index.htm
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/categorias/herramientas.png" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			  echo '

			   </div></div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		#menu tabla
			echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
			<td><img image-id="'$n'" src="/productos/categorias/herramientas.png" alt="'$n'" class="product-img img-responsive " width="80" height="80"></td> 
			<td>'$n'</td> 
			<td></td>
			<td></td>

			</tr>'>>menu_tabla.txt
					;;

			*)
				
				 rm -rf "$j"/index.shtml  "$j"/index.htm 

				 x=$(ls -p "$j"  | grep -v / )
				
				 z=$(echo $x |cut -d " " -f1 )

				 z=$(echo $j$z)

				 imagen=$(grep "xzoom-default" "$z"  | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g)
				

				 if [ -z "$imagen" ]

					then

						fabricante=$(pwd | cut -d "/" -f8)
						fabricante=$(echo $fabricante"_")
						imagen2=$(find /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/categorias -type f -iname "*$fabricante*" | cut -d "/" -f9)
						buscador_img=$(grep "buscador" index.htm)
						imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/fabricantes/'$imagen2'" />'
						sed -i "s#$buscador_img#$imagen_menu#g" index.htm
						echo '  <div class="card_item">

				  <div class="card_inner">

					<div class="card_top">' >> index.htm

					echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$imagen2'" src="/productos/categorias/'$imagen2'" alt="'$imagen2'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

					echo '   </div>

					<div class="card_bottom">
					<div class="card_info">
					  <div class="card_category"> ' >> index.htm

					  echo $n >>index.htm

					  echo '

					   </div></div>

					 

					</div>

				  </div>

				</div>'>>index.htm
			#menu tabla
				echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
				<td><img image-id="'$imagen2'" src="/productos/categorias/'$imagen2'" alt="'$imagen2'" class="product-img img-responsive " width="80" height="80"></td> 
				<td>'$n'</td> 
				<td></td>
				<td></td>

				</tr>'>>menu_tabla.txt
					else

						 echo '  <div class="card_item">

				  <div class="card_inner">

					<div class="card_top">' >> index.htm

					echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$imagen'" src="/productos/thumb2/'$imagen'" alt="'$imagen'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			
					echo '   </div>

					<div class="card_bottom">
					<div class="card_info">
					  <div class="card_category"> ' >> index.htm

					  echo $n >>index.htm
						buscador_img=$(grep "buscador" index.htm)
						imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/thumb2/'$imagen'" />'
						sed -i "s#$buscador_img#$imagen_menu#g" index.htm
					  echo '

					   </div></div>

					 

					</div>

				  </div>

				</div>'>>index.htm
				#menu tabla
				echo ' <tr onclick=window.location.href="'/$y2/$j2'index.shtml''" style="cursor: pointer;">
				<td><img image-id="'$imagen'" src="/productos/thumb2/'$imagen'" alt="'$imagen'" class="product-img img-responsive " width="80" height="80"></td> 
				<td>'$n'</td> 
				<td></td>
				<td></td>
				<td></td>
				
				</tr>'>>menu_tabla.txt

					fi

			;;

			esac

			

		done
		#inicio de creación de menu por productos
echo "SEGUNDO ENCABEZADO"		
echo '
					 <tr class="ignore-row">
					  <th id="celda5" style="display:none;"></th>
					  <th id="celda6" style="display:none;">Nombre</th>
					  <th id="celda7" style="display:none;">Número de parte</th>
					  <th id="celda8" style="display:none;">SKU</th>
					  <th id="celda9" style="display:none;">Tipo</th>
					  
					 </tr>
'>>menu_tabla.txt
		for i in "${array[@]}"

		do
			tmp_div=$(cat $i | grep 'id="datosmenu"')
			nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
			tipo=$( grep -A 1 '<i class="ai ai-checkmark color-success top " style="color: #375F85;">' $i | sed -n '2p' | sed 's/^[ \t]*//;s/[ \t]*$//')
			echo $i
			echo $nombre
			nombre2=$(cat $i | grep 'id="datosmenu"' | cut -d "#" -f2)
			#sku=$(cat $i | grep "SKU" | cut -d ">" -f4 | sed s#"</div"#""#g)
			sku=$(cat $i   | grep 'id="datosmenu"' | cut -d "#" -f4 | cut -d "<" -f1)
			no_parte=$(cat $i | grep 'id="datosmenu"' | cut -d "#" -f3)
			#sku2=$(cat $i | grep "SKU" | cut -d ">" -f4 | sed s#"</div"#""#g | cut -d ":" -f2)
			archivo_shtml=$(echo $i | sed s#"html"#"shtml"#g)
			b=${nombre%.html}
			
			c=${i%.html}
			echo $i	
			icon=$(grep "xzoom-default" $c.html | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g)

	#creando la segunda parte del menu en  tabla	
echo ' <tr onclick=window.location.href="'/$y2/$archivo_shtml'" style="cursor: pointer;">
		<td><img image-id="'$b'" src="/productos/thumb2/'$icon'" alt="'$b'" class="product-img img-responsive " width="80" height="80"></td> 
		<td>'$nombre2'</td> 
		<td>'$no_parte'</td>
		<td>'$sku '</td>
		<td>'$tipo '</td>
		</tr>'>>menu_tabla.txt

		echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm
			#Imagen opengraph
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/thumb2/'$icon'" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			echo '<a href="'/$y/$archivo_shtml'">' '<img image-id="'$b'" src="/productos/thumb2/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm

			echo '   </div>

			<div class="card_bottom">

			  <div class="card_category"> ' >> index.htm

			  echo $nombre2 '<br>' 'Num.Parte:'$no_parte '<br>' 'SKU:'$sku '<br>' 'Tipo:'$tipo '<br>'  >>index.htm

			  echo '

			   </div>

			 

			</div>

		  </div>

		</div>'>>index.htm
		sed -e "s?$tmp_div? ?g" -i $i #Eliminado div con datos del menu
		done
 
	else 
echo '
					 <tr class="ignore-row">
					  <th id="celda5" style="display:none;"></th>
					  <th id="celda6" style="display:none;">Nombre</th>
					  <th id="celda7" style="display:none;">Número de parte</th>
					  <th id="celda8" style="display:none;">SKU</th>
					  <th id="celda9" style="display:none;">Tipo</th>
					  
					 </tr>
'>>menu_tabla.txt		

		for i in "${array[@]}"

		do
			tmp_div=$(cat $i | grep 'id="datosmenu"')
			nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
			tipo=$( grep -A 1 '<i class="ai ai-checkmark color-success top " style="color: #375F85;">' $i | sed -n '2p' | sed 's/^[ \t]*//;s/[ \t]*$//')
			nombre2=$(cat $i | grep 'id="datosmenu"' | cut -d "#" -f2)
			#sku=$(cat $i | grep "SKU" | cut -d ">" -f4 | sed s#"</div"#""#g)
			sku=$(cat $i  | grep 'id="datosmenu"' | cut -d "#" -f4 | cut -d "<" -f1)
			no_parte=$(cat $i | grep 'id="datosmenu"' | cut -d "#" -f3)
			#sku2=$(cat $i | grep "SKU" | cut -d ">" -f4 | sed s#"</div"#""#g | cut -d ":" -f2)
			echo $i
			archivo_shtml=$(echo $i | sed s#"html"#"shtml"#g)
			b=${nombre%.html}
				
			c=${i%.html}

			icon=$(grep "xzoom-default" $c.html | cut -d " " -f7 | cut -d "/" -f4 | sed s/'"'/''/g)
			
	
#creando la segunda parte del menu en  tabla		
echo ' <tr onclick=window.location.href="'/$y2/$archivo_shtml'" style="cursor: pointer;">
		<td><img image-id="'$b'" src="/productos/thumb2/'$icon'" alt="'$b'" class="product-img img-responsive " width="80" height="80"></td> 
		<td>'$nombre2'</td> 
		<td>'$no_parte'</td>
		<td>'$sku '</td>
		<td>'$tipo '</td>
		</tr>'>>menu_tabla.txt

		echo '  <div class="card_item">

		  <div class="card_inner">

			<div class="card_top">' >> index.htm

			echo '<a href="'/$y/$archivo_shtml'">' '<img image-id="'$b'" src="/productos/thumb2/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240"></a>' >> index.htm
			#Imagen opengraph
			buscador_img=$(grep "buscador" index.htm)
			imagen_menu='<meta property="og:image" id="buscador" content=" http://telmedia.com.mx/productos/thumb2/'$icon'" />'
			sed -i "s#$buscador_img#$imagen_menu#g" index.htm
			echo '   </div>

			<div class="card_bottom">

			  <div class="card_category"> ' >> index.htm

			  echo $nombre2 '<br>' 'Num.Parte:'$no_parte '<br>' 'SKU:'$sku '<br>' 'Tipo:'$tipo '<br>' >>index.htm

			  echo '

			   </div>

			 

			</div>

		  </div>

		</div>'>>index.htm

					
		sed -e "s?$tmp_div? ?g" -i $i #Eliminado div con datos del menu
		done

	fi





	echo '

	</div>

	</div>

	'>>index.htm
	cat menu_tabla.txt >>index.htm
	echo ' </tbody>
       </table>
     </div>
   </div> <!-- end column -->
</div>

 </div><!--final tabla productos -->'>>index.htm
 #Adaptando la tabla por categorias o productos
 	no_categorias=$(grep "index.shtml" index.htm)
	no_productos=$(grep -v "index.shtml" index.htm | grep ".shtml")
if [ -z "$no_categorias" ] ; then
		echo '
	</body>
	</html>' >>index.htm

elif [[ -n "$no_categorias" && -n "$no_productos" ]]; then
	echo '
		 <script>
	 document.getElementById("celda1").style.display = "none";
	 document.getElementById("celda2").style.display = "none";
	 document.getElementById("celda3").style.display = "none";
	 document.getElementById("celda4").style.display = "none";
	 document.getElementById("celda5").style.display = "table-cell";
	 document.getElementById("celda6").style.display = "table-cell";
	 document.getElementById("celda7").style.display = "table-cell";
	 document.getElementById("celda8").style.display = "table-cell";
	 document.getElementById("celda9").style.display = "table-cell";
	 document.getElementById("Lproductos").style.display = "none";
	 document.getElementById("Lcategorias").style.display = "none";
	 document.getElementById("Lambas").style.display = "block";

		</script>
	</body>
	</html>' >> index.htm
else
	echo '
		 <script>
	 document.getElementById("celda1").style.display = "none";
	 document.getElementById("celda2").style.display = "none";
	 document.getElementById("celda3").style.display = "none";
	 document.getElementById("celda4").style.display = "none";
	 document.getElementById("Lproductos").style.display = "none";
	 document.getElementById("Lcategorias").style.display = "block";

		</script>
	</body>
	</html>' >> index.htm
fi
	

	#meta_imagen=$(cat index.htm | grep 'id="buscador"')
	#echo $meta_imagen
	#echo "Estoy en:" $(pwd)
	





	echo '<!--#include virtual="/tm/pages/header.htm"-->

	<br>

	<!--#include file="index.htm"-->

	<br>

	<!--#include virtual="/tm/pages/footer.htm"-->' >> index.shtml

	#read -n1 -r -p "Index creado, pulsa cualquier tecla para salir..." key



let contador=$contador+1

cd /cygdrive/c/inetpub/Telmedia/Desarrollo/

done

cd /cygdrive/c/inetpub/Telmedia/Desarrollo/
find -iname "menu_tabla.txt" -exec rm -f {} \;
rm -rf tmp.txt
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/
find . -iname "tmp.txt"  -exec rm -f {} \;
echo "Menus generados"