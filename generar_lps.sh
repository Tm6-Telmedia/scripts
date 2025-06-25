#!/bin/bash
#EJEMPLO DE USO: bash generar_lps.sh ~/Documents/GitHub/TM6/mkt/lp_aps-197-2.tab
x=$'\v'

dest1=/cygdrive/c/inetpub/Telmedia/Desarrollo/mkt/pubs_n.tab
destdir=/cygdrive/c/inetpub/Telmedia/Desarrollo/mkt/lp/
archivo="/cygdrive/c/inetpub/Telmedia/Desarrollo/mkt/lp_net2phone-304.tab"
#tr '\r' '\n' <$1 > $dest1
tr '\r' '\n' <$archivo > $dest1
no_filas=$( cat $dest1| wc -l)
echo filas: $no_filas
sleep 2
#for (( x=1; x<=$no_filas; x++ ))
#do  
##awk -v  i=$x -F "\t" ' FNR== i {print  $1}' nuevo.txt
split -l1 $dest1 
#done

for a in x??
#variables
do

banner=$(awk -F "\t" '{print  $3}' $a)
sobre_nosotros=$(awk -F "\t" '{print  $4}' $a)
titulo_banner=$(awk -F "\t" '{print  $5}' $a)
subtitulo_banner=$(awk -F "\t" '{print  $6}' $a)
titulo_texto=$(awk -F "\t" '{print  $7}' $a)
texto=$(awk -F "\t" '{print  $8}' $a)
caracteristicas=$(awk -F "\t" '{print  $9}' $a)
imagen=$(awk -F "\t" '{print  $10}' $a)
nombre_archivo=$(awk -F "\t" '{print  $7}' $a |cut -d ' ' -f1-2)
nombre_archivo2=$(awk -F "\t" '{print  $7}' $a |cut -d ' ' -f1-2 | tr -s ' ' '_')

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
    text-align: center;
    color: #fff;
    margin: auto;
	font-size: calc(.5rem + .5vw);
}
.banner__title{
    line-height: 1.2;
    color: #fff;
	font-weight: bold;
	font-size: 25px;
}

.banner__p{
    line-height: 1.2;
    font-size: 1.2em;
    opacity: 0.9;
    margin-top: 0em;
	font-size: 20px;

}
</style>


 <body id="top">

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
	  <br><br><br><br><br>
        <h2>'$titulo_texto '</h2>
      </div>
       <!-- end nested row -->
    </div>
  </div>
		<p>'$texto '</p>
		<br><br>
		<div class="row">
        <div class="col-md-6">
          <div class="headline">
            <h4>Sobre Nosotros</h4>
          </div>
          <p>'$sobre_nosotros '</p>
		  
        </div>
        <div class="col-md-6">
          <div class="headline">
            <h4>Características </h4>
          </div>
          <ul class="ai-ul">
		  
		  <li><i class="ai ai-li ai-1x ai-circle ai ai-star "></i>'$(echo $caracteristicas)'</li> 
		 </ul>
        </div>
      </div>
	  <br><br>
  <!-- Fin Post -->
  <!-- inicio Cita -->
        <div class="container content-wrap">
	<section class="home__group--highlight fadeIn">
	    <div class="row">
    
      <div class="col-md-6">
	  <h2 style="margin-left: 55px;margin-right: 55px;">¿Desea programar una sesión gratuita de asesoría con Telmedia?</h2><h3 style="margin-left: 55px;margin-right: 55px;">En caso de buscar adquirir alguna de nuestras soluciones o hablar con nosotr@s, le invitamos a programar su reunión aquí. <a href="https://telmedia.com.mx/tm/ssi/citas.shtml"><br><br> <div class="col-sm-7 col-center">
      <button type="button" class="btn btn-primary btn-lg btn-block" style="background: #855d37;border-color:#855d37; ">PROGRAMAR REUNIÓN</button></h3></a>
      </div>
      <div class="col-md-4 "style="margin-left: 55px;margin-right: 55px;">
        <br><a href="https://telmedia.com.mx/tm/ssi/citas.shtml"><img src="https://wp20.telmedia.com.mx/wp-content/uploads/2023/02/Telmedia-Contacto-1024x682.jpg" alt="" class="img-responsive img-nested"> </a>
      </div>
    </div> <!-- end row -->
	</section>
</div>
<!-- Fin Cita -->
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
        <h2>Publicaciones Recientes</h2>
      </div>
        <div class="row">
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
                  <a href="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html |grep '<a'|  sed s#'<a href="'#""#g| sed s#'>'#""#g| awk -F "\n" 'NR==1 {print $1}')'>
                    <div class="image-overlay"></div>
                      <img src="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html   |grep 'src'  | sed s#'<img class="media-object featured-image img-responsive" src="'#""#g | sed s#">"#""#g |awk -F "\n" 'NR==1 {print $1}') 'alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html  | grep "<h3>" | sed s#"<h3>"#""#g |  sed s#"</h3>"#""#g | sed s#"</div>"#""#g  | cut -d " " -f1-3 | awk -F "\n" 'NR==1 {print $1}')'</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
<a href="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html |grep '<a'|  sed s#'<a href="'#""#g| sed s#'>'#""#g| awk -F "\n" 'NR==2 {print $1}')'>                    <div class="image-overlay"></div>
                      <img src="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html   |grep 'src'  | sed s#'<img class="media-object featured-image img-responsive" src="'#""#g | sed s#">"#""#g |awk -F "\n" 'NR==2 {print $1}') 'alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html  | grep "<h3>" | sed s#"<h3>"#""#g |  sed s#"</h3>"#""#g | sed s#"</div>"#""#g  | cut -d " " -f1-3 | awk -F "\n" 'NR==2 {print $1}')'</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
<a href="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html |grep '<a'|  sed s#'<a href="'#""#g| sed s#'>'#""#g| awk -F "\n" 'NR==3 {print $1}')'>                    <div class="image-overlay"></div>
                      <img src="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html   |grep 'src'  | sed s#'<img class="media-object featured-image img-responsive" src="'#""#g | sed s#">"#""#g |awk -F "\n" 'NR==3 {print $1}') 'alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                      <span class="portfolio-entry-title">'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html  | grep "<h3>" | sed s#"<h3>"#""#g |  sed s#"</h3>"#""#g | sed s#"</div>"#""#g  | cut -d " " -f1-3 | awk -F "\n" 'NR==3 {print $1}')'</span>
                    </div>
                  </a>
                </div>
              </article>
          
            <article class="col-md-3 col-sm-6">
                <div class="image-effect-wrap">
<a href="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html |grep '<a'|  sed s#'<a href="'#""#g| sed s#'>'#""#g| awk -F "\n" 'NR==4 {print $1}')'>                    <div class="image-overlay"></div>
                      <img src="'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html   |grep 'src'  | sed s#'<img class="media-object featured-image img-responsive" src="'#""#g | sed s#">"#""#g |awk -F "\n" 'NR==4 {print $1}') 'alt="" class="img-responsive" style="margin-bottom: 30px">
                    <div class="image-description">
                    <span class="portfolio-entry-title">'$(cat /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html  | grep "<h3>" | sed s#"<h3>"#""#g |  sed s#"</h3>"#""#g | sed s#"</div>"#""#g  | cut -d " " -f1-3 | awk -F "\n" 'NR==4 {print $1}')'</span>

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
  </html>' >> tmp.html
cat tmp.html | sed s#"$x"#"<br>"#g > $nombre_archivo2.html	 
rm -rf tmp.html
echo '
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
 </head>
 <!--#include virtual="/tm/pages/header.htm"-->
<!--#include file="'$nombre_archivo2'.html"-->
<br>
<!--#include virtual="/tm/pages/footer.htm"-->' >> $nombre_archivo2.shtml
	 
mv -f $nombre_archivo2.html $destdir/$nombre_archivo2.html
mv -f $nombre_archivo2.shtml $destdir/$nombre_archivo2.shtml

done
z=$(find . -name "x*")
rm -rf $z