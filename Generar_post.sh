#!/bin/bash
# tr '\r' '\n' <Pubs.tab > pubs_n.tab
#let no_filas=$( cat nuevo.txt| wc -l)
#for (( x=1; x<=$no_filas; x++ ))
#do  
#awk -v  i=$x -F "\t" ' FNR== i {print  $1}' nuevo.txt
#done


#variables
banner=$(awk -F "\t" '{print  $3}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
sobre_nosotros=$(awk -F "\t" '{print  $4}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
titulo_banner=$(awk -F "\t" '{print  $5}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
subtitulo_banner=$(awk -F "\t" '{print  $6}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
titulo_texto=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
texto=$(awk -F "\t" '{print  $8}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
caracteristicas=$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
imagen=$(awk -F "\t" '{print  $10}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt)
nombre_archivo=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt |cut -d ' ' -f1-2)
nombre_archivo2=$(awk -F "\t" '{print  $7}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt |cut -d ' ' -f1-2 | tr -s ' ' '_')
echo "<!doctype html>
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

  <title>" $nombre_archivo '</title>
 <!-- Inicio Open Graph Data -->' '
 <meta property="og:title" content="'$nombre_archivo '" />
 <meta property="og:url" content="https://tm6.telmedia.com.mx/mkt/lp/axis/'$nombre_archivo'.shtml" />
 <meta property="og:type" content="website">
 <meta property="og:image" content="https://tm6.telmedia.com.mx'$imagen'" />
 <meta property="og:description" content="'$subtitulo_banner '" />
 <!-- Fin Open Graph Data -->	 <meta name="description" content="'$subtitulo_banner '">
 </head>
 <body id="top">
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
		  
		  <li><i class="ai ai-li ai-1x ai-circle "></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f1-1 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f2-2 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle "></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f3-3 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f4-4 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle "></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f5-5 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f6-6 |tr -s ':' ' ')'</p>
		 <li><i class="ai ai-li ai-1x ai-circle "></i>'$(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f7-7 |tr -s ':' ' ')'</li> <p><strong class="text-muted"></strong>' $(awk -F "\t" '{print  $9}' /c/inetpub/Telmedia/Desarrollo/mkt/post3.txt | cut -d ':' -f8-8 |tr -s ':' ' ')'</p>''
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
  </html>' >> $nombre_archivo2.html
echo '
<!--#include virtual="/tm/pages/header.htm"-->
<br>
<!--#include file="'$nombre_archivo2'.html"-->
<br>
<!--#include virtual="/tm/pages/footer.htm"-->' >> $nombre_archivo2.shtml
		 
mv -f $nombre_archivo2.html /c/inetpub/Telmedia/Desarrollo/mkt/lp/Axis/$nombre_archivo2.html
mv -f $nombre_archivo2.shtml /c/inetpub/Telmedia/Desarrollo/mkt/lp/Axis/$nombre_archivo2.shtml


 
 
		

	











