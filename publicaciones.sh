
echo "<!DOCTYPE html>
<html lang="en">
<head>   
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
<div class="col-md-12 col-center">
			<br/>
  			<h2 class="text-center">Publicaciones Recientes</h2>
		</div>
		
  <div class="container content-wrap">  
  <div class="row">
    <!-- posts -->
    <section>
      <div class="dataList" id="dataDiv">
        <div class="post-listing-wrap">" >> publicaciones.html
awk -F "\t" '{print "<a href=\"" $9 "\">" "\n" "<div class=\"post-listing media\">" "\n" "<div class=\"stand-out\">" "\n" " <div class=\"featured-image-wrap\">" "\n" "<img class=\"media-object featured-image img-responsive\" src=\"" $8 "\">" "\n" "</div>" "\n" "<div class=\"media-body\">" "\n" "<div class=\"heading\">" "\n" "<h3>" $6 "</h3></div>""\n" "<p class=\"post-excerpt full\" >" $7 "</p>" "\n" "<div class=\"post-meta-wrap\">" "\n" "<ul class=\"post-meta list-inline\">" "\n" "<li><span class=\"ai ai-linkedin \"></span>" $4 "</li>" "\n" "<li><span class=\"ai ai-calendar\"></span>" $3 "</li>" "\n" "  </ul></div> </div> </div> </div> </a>" "\n"}' /c/inetpub/Telmedia/Desarrollo/mkt/pubs_n.tab >> publicaciones.html
echo "</div>
      </div>
      <div class="clearfix"></div>
    </section> <!-- end posts -->
  </div> <!-- end row -->
</div> <!-- end container -->

  
    </div> <!-- end page-wrap -->
    
</body>
</html>" >> publicaciones.html

mv -f publicaciones.html /c/inetpub/Telmedia/Desarrollo/tm/pages/publicaciones.html