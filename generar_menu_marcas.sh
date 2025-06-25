cd /cygdrive/c/inetpub/Telmedia/Desarrollo/
x=$(find  productos/ -maxdepth 1 -type d -not -name 'img' -not  -name 'img2' -not -name 'thumb'  -not -name 'brochure'  -not -name 'categorias' -not -name 'demo' |  cut -d "/" -f2 | sort)
rm -rf  /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index2.htm
rm -rf  /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index.shtml


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
	<script src="/productos/categorias/js/categorias_marcas.js"></script>
	<meta charset="UTF-8">
	<title>Telmedia-Productos</title>

    <link href="/tm/assets/css/banner_infraestructura.css" rel="stylesheet" >
   
	<link rel="stylesheet" href="/tm/assets/css/styles.css">
	<meta name="ss360" content="noindex" />
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
					
					<FONT COLOR="white"><p>	</p></font>
				  
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
				 for i in $x 
					do
						opcion=$(echo $i |sed -e "s/\b\(.\)/\u\1/g")
						echo '<option value="'$i'" >'$opcion'</option>' >> tmp.htm
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
  
  
  
for i in $x 
	do
	echo "Carpeta " $i
	imagen=$(echo $i"_")
	imagen=$(find /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/categorias -type f -iname "*$imagen*" | cut -d "/" -f9)
	echo "Imagen "$imagen
	nombre=$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/fabricantes/fabricantes.tab | grep -Fw "$i" | awk -F "\t" '{print $2}')
	echo $nombre
	fecha=$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/fabricantes/fabricantes.tab | grep -Fw "$i" | awk -F "\t" '{print $3}')
	lugar=$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/fabricantes/fabricantes.tab | grep -Fw "$i" | awk -F "\t" '{print $4}')
	texto=$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/fabricantes/fabricantes.tab | grep -Fw "$i" | awk -F "\t" '{print $5}')
	echo '<div class="card_item" id="'$i'm">
					<div class="card_inner">
						<div class="card_top">
						   <a href="/productos/'$i'/index.shtml">
							  <img image-id="'$i'" src="/productos/categorias/'$imagen'" alt="'$i'" class="product-img img-responsive " width="200" height="120"></a>
						</div>
						<div class="card_bottom">
						  <div class="card_category">'$fecha' </div>
						  <div class="card_info">
							<p class="title">'$nombre'</p>
							<p>'$texto'</p>
						  </div>
						  <div class="card_creator">'$lugar'
						  </div>
					</div>
			  </div>
			</div>' >> tmp2.htm
			
					  
	done	
echo '</div>


</body>
</html>'>> tmp2.htm	
cat tmp.htm >>index2.htm
cat tmp2.htm >>index2.htm
rm -rf tmp.htm tmp2.htm
echo '<!--#include virtual="/tm/pages/header.htm"-->

	<br>

	<!--#include file="index2.htm"-->

	<br>

	<!--#include virtual="/tm/pages/footer.htm"-->' >> index2.shtml
mv /cygdrive/c/inetpub/Telmedia/Desarrollo/index2.htm /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index2.htm
mv /cygdrive/c/inetpub/Telmedia/Desarrollo/index2.shtml /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index.shtml

#Generando script de filtrado por marcas
echo "Generando script de filtrado por marcas"
echo "
function categorias()
{
var seleccion=document.getElementById('select1');
var x = document.getElementById('select1').value=seleccion.options[seleccion.selectedIndex].value; 
switch (x) {" >>categorias_marcas.js

				 for i in $x 
					do
					echo "case '"$i"':">>categorias_marcas.js
						marca=$(echo $i'm')
						cat /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index2.htm | grep  '<div class="card_item"' | grep -wv $marca | sed s*'<div class="card_item" id="'*'$("#'*g |sed s*'>'*').hide();'* >>categorias_marcas.js
						echo '$("#'$marca'").show();'>>categorias_marcas.js
						echo 'break;' >>categorias_marcas.js
					done
echo 'default:'>>categorias_marcas.js
cat /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/index2.htm | grep  '<div class="card_item"'  | sed s*'<div class="card_item" id="'*'$("#'*g |sed s*'>'*').show();'* >>categorias_marcas.js
echo 'break;
}
}' >>categorias_marcas.js
rm -rf /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/categorias/js/categorias_marcas.js
mv /cygdrive/c/inetpub/Telmedia/Desarrollo/categorias_marcas.js /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/categorias/js/categorias_marcas.js
