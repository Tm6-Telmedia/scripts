cd /cygdrive/c/inetpub/Telmedia/Desarrollo/

rm -rf tmp.txt

find productos2/ -type d -not -name 'img' -not  -name 'img2' -not -name 'thumb'  -not -name 'brochure'  -not -name 'categorias' -not -name 'js'  >tmp.txt #---> buscando  directorios
no_lineas=$(cat tmp.txt | wc -l)
#cat tmp.txt
let contador=2
echo $no_lineas
ls -l tmp.txt
while [ $contador -le $no_lineas ] #---> ciclo para moverse entre los diferentes directorios
do
	ruta=$(sed -n "$contador"p tmp.txt) #---> Obteniedo el directorio del documento

	ruta2=$(echo '"'$ruta'"')  #---> Agregando comillas a la variable del directorio
	echo $rut	2
	eval cd $ruta2  #---> Moviendose al directorio 

	pwd
	
	let contador=$contador+1
	done  
	