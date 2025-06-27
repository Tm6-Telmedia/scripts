#!/bin/bash
rm -rf index.shtml  index.htm
redes=$(echo redes)
base=$(cat /C/inetpub/Telmedia/scripts/icon/base_menu_2.txt)
echo $base >> index.htm
dir=$(pwd)
x=$(pwd| cut -d "/" -f7- --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
y=$( pwd| cut -d "/" -f6- --output-delimiter=$'/')
z=$(pwd| cut -d "/" -f6-8 --output-delimiter=$'/')
nodir=$( ls  -p | grep "/" | wc -l)
nodir2=$(ls  -p | grep "/"| tr "/" "\n")
echo "<title>""Telmedia-Productos-"$x "</title>" >> index.htm
echo "<h1>" $x "</h1>" >> index.htm
echo '</div> ' '</div> '  '</div> ' >> index.htm
cd ..
dir2=$(pwd |cut -d "/" -f6- --output-delimiter=$'/')
cd "$dir"
echo '<a href="'/$dir2/index.shtml'">' '<img image-id="flecha" src="/productos/categorias/atras.png" alt="flecha" class="product-img img-responsive " width="25" height="50"></a>'>> index.htm
echo '<div class="container content-wrap">' >> index.htm
echo '<div class="row">' >> index.htm
echo '<section class="col-md-10">' >> index.htm
echo '<div class="row">' >> index.htm
archivos=$(find *.shtml)
array=($archivos)
array2=($nodir2)

let flag=0
if [[ $nodir > 0 ]]
then
	for j in */
	do
		n=$(echo $j |cut -d "/" -f1- --output-delimiter=$' ' |sed -e "s/\b\(.\)/\u\1/g")
		n2=$(echo $j |cut -d "/" -f1- --output-delimiter=$'-')  
		case $n2 in 
		redes-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Redes.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;

		seguridad-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Seguridad.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
				
		almacenamiento-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Almacenamiento.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
				
		cctv-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/CCTV.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
				
		computo-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Computo.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
				
		'cloud'-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Servicios Cloud.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
				
		'video conferencias'-)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">' '<img image-id="'$n'" src="/productos/categorias/Video Conferencias.png" alt="'$n'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				;;
		*)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'index.shtml''">'  >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$n '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
		;;
		esac
		
	done

	for i in "${array[@]}"
	do
		nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
		b=${nombre%.shtml}
		c=${i%.shtml}
		icon=$(grep "myimage0" $c.html |cut -d " " -f6 | cut -d "/" -f4 | cut -d '"' -f1)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$i'">' '<img image-id="'$b'" src="/productos/thumb/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240">' >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$b '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
				
	done

else	
	for j in "${array[@]}"
	do
		nombre=$(echo $j| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
		b=${nombre%.shtml}
		c=${j%.shtml}
		icon=$(grep "myimage0" $c.html |cut -d " " -f6 | cut -d "/" -f4 | cut -d '"' -f1)
		echo ' <div class="col-md-4">' >> index.htm
		echo '<div class="product-box">' >> index.htm
		echo '<a href="'/$y/$j'">' '<img image-id="'$b'" src="/productos/thumb/'$icon'" alt="'$b'" class="product-img img-responsive " width="400" height="240">'  >> index.htm
		echo '<div class="product-info-slider row">' '<h4>'$b '</h4>' >> index.htm 
		echo '   </div>
					</a>
				  </div>
				</div> ' >> index.htm
	done
fi
	echo ' 
</div>
<div class="text-center">
      <ul class="pagination">
        <li class="disabled"><a href="#">&laquo;</a></li>
        <li class="active"><span>1<span class="sr-only">(current)</span></span></a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div> <!-- end pagination -->
    </section>
  </div> <!-- end row -->
</div> <!-- end container -->

  
    </div> <!-- end page-wrap -->
    

  </body>
</html>
' >> index.htm 

echo '<!--#include virtual="/tm/pages/header.htm"-->
<br>
<!--#include file="index.htm"-->
<br>
<!--#include virtual="/tm/pages/footer.htm"-->' >> index.shtml
read -n1 -r -p "Index creado, pulsa cualquier tecla para salir..." key