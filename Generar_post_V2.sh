#!/bin/bash
# tr '\r' '\n' <Pubs.tab > pubs_n.tab
#let no_filas=$( cat nuevo.txt| wc -l)
#for (( x=1; x<=$no_filas; x++ ))
#do  
#awk -v  i=$x -F "\t" ' FNR== i {print  $1}' nuevo.txt
#done


#variables
banner=$(awk -F "\t" '{print  $3}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
sobre_nosotros=$(awk -F "\t" '{print  $4}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
titulo_banner=$(awk -F "\t" '{print  $5}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
subtitulo_banner=$(awk -F "\t" '{print  $6}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
titulo_texto=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
texto=$(awk -F "\t" '{print  $8}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
caracteristicas=$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
imagen=$(awk -F "\t" '{print  $10}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt)
nombre_archivo=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt |cut -d ' ' -f1-2)
nombre_archivo2=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt |cut -d ' ' -f1-2 | tr -s ' ' '_')
echo '<!doctype html>
<html lang="es">
<style>
.banner{
    height: 200px;
    position: relative;
    background: #375F85;
    display: flex;
    align-items: center;
    justify-content: center;
}
.banner__img{
    height: 100%;
    width: 100%;
    object-fit: cover;
#    opacity: 0.9;
}

.banner__info{
    padding:0 3em;
    position: absolute;
    width: 100%;
    max-width: 800px;
    text-align: center;
    color: #fff;
    margin: auto;
}
.banner__title{
    line-height: 1.4;
    font-size: 2.0em;
    color: #fff;
}

.banner__p{
    line-height: 1.1;
    font-size: 1.2em;
    opacity: 0.9;
    margin-top: 0em;
}
</style>

<head>
 <meta charset="UTF-8"/>
 <title>' $nombre_archivo '</title>
 <!-- Inicio Open Graph Data -->' '
 <meta property="og:url" content="https://tm6.telmedia.com.mx/mkt/lp/axis/'$nombre_archivo'.shtml" />
 <meta property="og:type" content="website">
 <meta property="og:title" content="'$nombre_archivo '" />
 <meta property="og:description" content="'$subtitulo_banner '" />
 <meta property="og:image" content="https://tm6.telmedia.com.mx'$imagen'" />
 <meta name="author" content="Telmedia"/>
 <!-- Fin Open Graph Data -->	 <meta name="description" content="'$subtitulo_banner '">
 <!-- RESPONSIVE VIEWPORT -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- FAVICON -->
    <link rel="icon" type="image/png" href="/tm/assets/img/faviconB.png" />

    <!-- STYLESHEETS -->
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css"/>

    <!-- CORE DEFAULT Stylesheet (theme scheme) - DEFAULT THEME SCHEME HERE -->
    <link href="/tm/assets/css/global-style_light--blue.min.css" rel="stylesheet" />

    <!-- SCHEMA JSON LD -->
 <!-- ANALYTICS -->
    
    <script>'"
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-76398157-1', 'auto');
      ga('send', 'pageview');

    </script>

    <!-- Global site tag (gtag.js) - Google Analytics  prueba de integracion html-->"'
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-184237722-1">
    </script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}'"
    gtag('js', new Date());
    gtag('config', 'UA-184237722-1');
    </script>"'
 
 </head>
 <body id="top">
 <header id="header" class="header slide animated bg-blue" role="banner">
  <div class="container"> <!----> 
   <!--<div class="row">--> 

      <div class="navbar-header">
        <!-- TOGGLE BUTTON for mobile -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".menuSup0">
          <span class="sr-only">Toggle navigation</span>
          <span class="ai ai-menu ai-2x ai-white"></span>
        </button>

      <!--TELMEDIA LOGO ON BLUE BAR-->
      <!-- sitewide logo LINK TO ROOT INDEX (home) PAGE -->
      <a href="/index.shtml" class="navbar-brand">
        <span class="logo-top">
          <img src="/tm/assets/img/telmedia-logo5w.png" alt="Telmedia"/><span class="ai"></span>
          <!--img src="/tm/assets/img/logo_wt580x280.svg" alt="Telmedia"/><span class="ai"></span-->
        </span>
        <!-- Hidden text in an h1 tag for SEO purposes -->
        <h1 class="text-hide">Telmedia</h1>
      </a> <!-- end site-wide logo link -->

      </div> <!-- end navbar-header -->

      <!-- NAVIGATION -->

      <div class="collapse navbar-collapse menuSup0" >
        <nav class="navbar bg-blue" role="navigation">
          <ul class="nav navbar-nav navbar-right">

           

            <!-- Infraestructura -->
            <li class="dropdown dropdown-text">
              <a class="dropdown-toggle" href="/productos/index.shtml" aria-haspopup="true">Infraestructura</a>
            </li>

             <!-- Cloud -->
             <li class="dropdown-text">
              <a class="dropdown-toggle" line-height: 1.2 href="/tm/ssi/cloud/integracion.shtml" aria-haspopup="true">Cloud</a>
            </li>

            <!-- Servicios -->
            <li class="dropdown dropdown-text">
            <a class="dropdown-toggle" href="/tm/ssi/soporte.shtml" aria-haspopup="true">Servicios</a>
            <!--a class="dropdown-toggle" href="/tm/ssi/wp20.shtml" aria-haspopup="true">Servicios</a-->
            </li>


            <!-- Mas -->
            <li class="dropdown">
              <a class="dropdown-toggle" href="#" aria-haspopup="true">. . .</a>
              <ul class="dropdown-menu">
                <span class="triangle-up"></span>
                <!-- li><a href="https://store.telmedia.com.mx">Tienda en Línea</a></li -->
                <li><a href="/tm/ssi/about.shtml" data-theme="default">Perfil de la Empresa</a></li>
                <!--li><a href="" id="script1">Contáctanos</a></li--><!--mandar a whatson /tm/ssi/FormRegistro.shtml-->
                <!--li><a href="/tm/ssi/FormRegistro.shtml">Contáctanos</a></li--><!--mandar a whatson-->
                <li><a href="/tm/ssi/form_registro2.shtml">Contáctanos</a></li><!--mandar a whatson-->
                <li><a href="/tm/ssi/bolsa_trabajo.shtml">¿Buscas Trabajo?</a></li>
                <!-- li><a href="/tm/ssi/tipo_cambio.shtml">Tipo de Cambio</a></li -->
              </ul>
              
            </li>
            <!-- Barra de busqueda-->
            <li class="dropdown" style="margin-top: 6px;" onclick="mensaje_busqueda()" >
              
              <script type="text/javascript"  
                    id="bcs_js_snippet"
                    src="https://ui.customsearch.ai/api/ux/rendering-js?customConfig=6acc336f-53f8-447a-b760-a67522a0d1ea&market=en-US&version=latest&q=">
            </script> 

              <script>
                function mensaje_busqueda() {
                  alert("Por favor utiliza nuestro Asistente virtual Watson (esquina inferior derecha) para cualquier búsqueda que requieras");
                }
                </script>
            </li>
        
            <!--Iframe TipoCambio-->
            <li class="dropdown">
              <!--iframe src="https://tm6.telmedia.com.mx/tc/tipocambio.html" scrolling="no" -->
              <iframe src="/tc/tipocambio.html" scrolling="no"
              style= "border: none; float: right;
              width: 190px; height: 48px; margin-top: 3px; margin-left: 5px;
              opacity: 1; "
              ></iframe>
            </li>
          </ul>

        </nav> <!-- END TOP NAVIGATION -->
      </div> <!-- end navbar wrapper -->
    

    <!--  </div> end row -->
  </div> <!--end container -->
</header>
<br>
 <section class="banner">
    <img class="banner__img" src="'$banner'">' '
    <div class="banner__info">
        <h2 class="banner__title">'$titulo_banner '</h2>
		<p class="banner__p">' $subtitulo_banner '</p>
		   </div>
</section> 
  
<div class="container content-wrap">
  <div class="row">
  <!-- Inicio Banner -->
    <div class="col-md-6">
	<br>
      <img src="'$imagen '"alt="" class="img-responsive img-nested">
    </div>
	<!-- Fin Banner -->
	
	<!-- Inicio Post -->
    <div class="col-md-6">
      <div class="headline">
        <h2>'$titulo_texto '</h2>
      </div>
      <p>'$texto '</p>
      <div class="row">
        <div class="col-md-6">
          <div class="headline">
            <h4>Sobre Nosotros</h4>
          </div>
          <p>'$sobre_nosotros '
		  </p>
        </div>
        <div class="col-md-6">
          <div class="headline">
            <h4>Características </h4>
          </div>
          <ul class="ai-ul">
		  
		  <li><i class="ai ai-li ai-1x ai-circle ai ai-star "></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f1-1 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f2-2 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle ai ai-star3"></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f3-3 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f4-4 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle ai ai-star"></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f5-5 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f6-6 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle ai ai-star3"></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f7-7 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/141.txt | cut -d ':' -f8-8 |tr -s ':' ' ')'</p>''
		 </ul>
        </div>
      </div> <!-- end nested row -->
    </div>
  </div>
  <!-- Fin Post -->
  <!-- Inicio Formulario -->
<div class="container content-wrap"> 
<h1>Contáctanos para más información. </h1>
<div class="well wow fadeInRight">
  <form 
    class="form-horizontal" 
    role="form" 
    id="contactForm"
    data-bv-feedbackicons-valid="ai ai-checkmark"
    data-bv-feedbackicons-invalid="ai ai-close"
    data-bv-feedbackicons-validating="ai ai-spinner"
      >
    <div class="form-group">
      <label for="name" class="col-sm-2 control-label">Nombre</label>
      <div class="col-sm-10">
        <input 
          type="text" 
          class="form-control" 
		  name="nombre">
      </div>
    </div>
	    <div class="form-group">
      <label for="telefono" class="col-sm-2 control-label">Teléfono</label>
      <div class="col-sm-10">
        <input 
          type="tel" 
          class="form-control" 
          name="telefono" >
         
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
      <div class="col-sm-10">
        <input type="email" 
          class="form-control" 
          name="email" >
      </div>
    </div>
	    <div class="form-group">
      <label for="empresa" class="col-sm-2 control-label">Empresa</label>
      <div class="col-sm-10">
        <input  type="text" 
          class="form-control"
		  name="empresa">
      </div>
    </div>
    <div class="col-sm-12">
      <div class="form-group">
        <textarea class="form-control" style="min-height:300px;" placeholder="Más información..."></textarea>
      </div>
    </div>
    <div class="col-sm-6 col-center">
      <button type="submit" class="btn btn-primary btn-lg btn-block">Send Message</button>
    </div>
  </form>
  
  
</div>

</div><!-- Fin Formulario -->
  
  <div class="row spacer-top--large">
    <div class="col-md-12">
      <div class="headline">
        <h2>Posts Similares</h2>
      </div>
        <div class="row">
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
                  <a href="#">
                    <div class="image-overlay"></div>
                      <img src="/tm/assets/img/Telmedia-Computo-para-Ciencia-e-Investigacion_Reducida.png" alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">Pronto...</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
                  <a href="#">
                    <div class="image-overlay"></div>
                      <img src="/tm/assets/img/Telmedia-Computo-para-Ciencia-e-Investigacion_Reducida.png" alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">Pronto...</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
                  <a href="#">
                    <div class="image-overlay"></div>
                      <img src="/tm/assets/img/Telmedia-Computo-para-Ciencia-e-Investigacion_Reducida.png" alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">Pronto...</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
                  <a href="#">
                    <div class="image-overlay"></div>
                      <img src="/tm/assets/img/Telmedia-Computo-para-Ciencia-e-Investigacion_Reducida.png" alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">Pronto...</span>
                    </div>
                  </a>
                </div>
              </article>
          
        </div> <!--  end nested row -->
      </div>
  </div>
  </div>
  
  
  </body>
  
  


    <!-- SCRIPTS -->
    <!-- jQuery first -->
    <!script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script-->
    <script src="/tm/assets/js/jquery3.6.js"></script-->

    <!-- Global Scripts -->
    <script src="/tm/assets/js/global-adapto.min.js"></script>
    <script src="/tm/assets/js/global-bootstrap.min.js"></script>
  </html>' >> $nombre_archivo2.html
echo '

<!--#include file="'$nombre_archivo2'.html"-->
<br>
<!--#include virtual="/tm/pages/footer.htm"-->' >> $nombre_archivo2.shtml
		 
mv -f $nombre_archivo2.html /c/inetpub/Telmedia/Desarrollo/mkt/lp/Axis/$nombre_archivo2.html
mv -f $nombre_archivo2.shtml /c/inetpub/Telmedia/Desarrollo/mkt/lp/Axis/$nombre_archivo2.shtml


 
 
		

	











