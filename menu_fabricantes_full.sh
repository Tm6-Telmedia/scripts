#!/bin/bash
cd  /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/
rm -rf index_full.htm index_full.shtml
fabricantes=$(find . -maxdepth 1 -type d -not -name brochure -not -name categorias -not -name demo -not -name img -not -name thumb -not -path '.' -printf '%f\n')
#Generando menu de marcas
echo "Generando menu de marcas"
echo '
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Inicio Open Graph Data -->
		<meta property="og:title" content="Telmedia-Productos" />
		<meta property="og:url" content="https://telmedia.com.mx/tm/ssi/AvisoPrivacidad.shtml" />
		<meta property="og:image" content=" http://telmedia.com.mx/tm/assets/img/icon1.png" />
		<meta property="og:description" content="Telmedia: empresa mexicana enfocada en infraestructura fisica, virtual y cloud para comunicaciones y tecnologías de la información" />
    <!-- Fin Open Graph Data -->
	<meta name="description" content="Telmedia: empresa mexicana enfocada en infraestructura fisica, virtual y cloud para comunicaciones y tecnologías de la información">	
	<script src="/productos/categorias/js/categorias_marcas_full.js"></script>
	<meta charset="UTF-8">
	<title>Telmedia-Productos</title>

    <link href="/tm/assets/css/banner_infraestructura.css" rel="stylesheet" >
   
	<link rel="stylesheet" href="/tm/assets/css/styles.css">
	<meta name="ss360" content="noindex" />
	<link rel="canonical" href="https://telmedia.com.mx/productos/">
</head>
<body>
<div class="page-wrap">
<div class="banner-tm-top">
<div class="container">
  <div class="row">
    <div class="col-sm-12 text-left">
      <div class="col-sm-6">

        <!--div class="portfolio-home-img-wrap no-border">
          <img src="../assets/img/home/model-studio.png" alt="portfolio home featured image" class="animated bounceInRight">
        </div-->
      </div>

      <div class="col-sm-6">
        <div class="animated bounceInRight">
          <div id="portfolio-home-caption">
   <!--h2 class="f500 no-bottom-margin"> Infraestructura de Comunicaciones y Cómputo</h2-->       
    <p class="lead spacer-top--small"><b>Infraestructura de Comunicaciones y Cómputo</b>
              <ul>
                <li>Almacenamiento</li>
                <li>Cableado</li>
                <li>CCTV</li>
                <li>Ciber-Seguridad</li>
                <li>Cómputo para Ciencia e Investigación</li>
                <li>Cómputo Empresarial</li>
                <li>Redes de voz, datos y video</li>
                <li>Video-conferencia</li>
              </ul>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- END row -->
</div> <!-- END container -->
</div>
		<div id="barra_color_cafe"> <!-- barra_color_cafe -->
		  <style>
		 .page-header-wrap2{width:100%;min-height:35px;background-color:#855D37}
		 </style>
		 <div class="page-header-wrap2">
				<div class="container">
				  <div class="page-header">
					
					<FONT COLOR="white" style="font-size: 15px;"><p>	Nuestro catálogo está siendo actualizado, cientos de SKUs están siendo procesados. Contáctenos si requiere información de algún nuevo producto.</p></font>
				  
				  </div> 
				</div> 
			  </div> 
	     </div>
<div class="page-wrap">
      
      <div class="page-header-wrap">
        <div class="container">
          <div class="page-header">
            
            <div class="row" style="margin-bottom:5px">
				<a href="/productos/index.shtml"><div class="col-sm-6"><div ><h2>Listado por Marcas</h2></a>	
                
				<label for="disabledSelect" class="form-label">Filtar por marca</label>

                 <select class="form-select" id="select1" onChange="categorias()">
					<option value="todos" selected>Todos</option>'>> tmp.htm
#crenado select de fabricantes					
for select in $fabricantes
	do
		opcion=$(echo $select |sed -e "s/\b\(.\)/\u\1/g")
		echo '<option value="'$select'" >'$opcion'</option>' >> tmp.htm
 
	done

echo '	
                  
                </select>

            </div></div>
				<a href="/productos/categorias.shtml"><div class="col-sm-6"><div ><h2>Listado por Categorias</h2></div></div></a>
				

            
          </div> <!-- end page-header -->
        </div> <!-- end container -->
      </div> <!-- end page-header-wrap -->
	  
<div class="wrapper" >

  <div class="cards_wrap">' >> tmp.htm
  
  for x in $fabricantes
	do
		imagen=$(echo $x"_")
		
		imagen=$(find ../productos/categorias -type f -iname "${imagen}*" -exec basename {} \;)
		echo $imagen
		echo '<div class="card_item" id="'$x'm">
					<div class="card_inner" onclick=window.location.href="/productos/'$x'/index.shtml" style="cursor: pointer;">
						<div class="card_top">
						   <a href="/productos/'$x'/index.shtml">
							  <img image-id="'$x'" src="/productos/categorias/'$imagen'" alt="'$x'" class="product-img  " width="200" height="80"></a>
						</div>
						<div class="card_bottom">
						  <div class="card_category">'' </div>
						  <div class="card_info">
							<p class="title">'$x'</p>
							<p>''</p>
						  </div>
						  <div class="card_creator">''
						  </div>
					</div>
			  </div>
			</div>' >> tmp2.htm
 
	done
	
	echo '</div>
		</div>

</body>
</html>'>> tmp2.htm	
cat tmp.htm >>index_full.htm
cat tmp2.htm >>index_full.htm
rm -rf tmp.htm tmp2.htm
echo '<!--#include virtual="/tm/pages/header.htm"-->

	<br>

	<!--#include file="index_full.htm"-->

	<br>
	<!--#include virtual="/tm/pages/cookies.html"-->
	<!--#include virtual="/tm/pages/footer.htm"-->' >> index_full.shtml
	
#Generando script de filtrado por marcas
echo "Generando script de filtrado por marcas"
echo "
function categorias()
{
var seleccion=document.getElementById('select1');
var x = document.getElementById('select1').value=seleccion.options[seleccion.selectedIndex].value; 
switch (x) {" >>categorias_marcas_full.js

  for y in $fabricantes
	do
		echo "case '"$y"':">>categorias_marcas_full.js
		marca=$(echo $y'm')
		cat index_full.htm | grep  '<div class="card_item"' | grep -wv $marca | sed s*'<div class="card_item" id="'*'$("#'*g |sed s*'>'*').hide();'* >>categorias_marcas_full.js
		echo '$("#'$marca'").show();'>>categorias_marcas_full.js
		echo 'break;' >>categorias_marcas_full.js
			
	done
echo 'default:'>>categorias_marcas_full.js
cat index_full.htm | grep  '<div class="card_item"'  | sed s*'<div class="card_item" id="'*'$("#'*g |sed s*'>'*').show();'* >>categorias_marcas_full.js
echo 'break;
}
}' >>categorias_marcas_full.js
rm -rf categorias/js/categorias_marcas_full.js
mv categorias_marcas_full.js categorias/js/categorias_marcas_full.js
read -n1 -r -p "Menu generado correctamente, pulsa cualquier tecla para continuar..." key