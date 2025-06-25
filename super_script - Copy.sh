#!/bin/bash

#procesando las imagenes de los productos
#echo "Procesando imágenes de los productos"
#echo "Haciendo las imágenes cuadradas"
#bash /cygdrive/c/inetpub/Telmedia/scripts/cambiar_tamaño_imagen_zoom.sh
#echo "Agregando mascara de agua a las imágenes"
#bash /cygdrive/c/inetpub/Telmedia/scripts/maskwater.sh
#echo "Cambiando el formato (webp) a las imágenes"
#bash /cygdrive/c/inetpub/Telmedia/scripts/formato_webp.sh
#Paso 1
echo "Eliminado carpetas de productos en desarrollo"
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/
find . -mindepth 1 -maxdepth 1 -type d ! \( -name 'img' -o -name 'brochure' -o -name 'categorias' -o -name 'demo' -o -name 'thumb' \) -exec rm -r {} \;
#paso 2
echo "Generando los productos"

#paso3 
echo "Generando los shtml's de los productos"
bash /cygdrive/c/inetpub/Telmedia/scripts/crea_shtmls.sh
#paso 4
echo "Creando menus de marcas"
bash /cygdrive/c/inetpub/Telmedia/scripts/generar_menu_marcas.sh
#paso 5
echo "Creando menus de productos"
bash /cygdrive/c/inetpub/Telmedia/scripts/Menu_nuevo.sh
#paso 6
echo "Eliminado carpetas de productos en TM6"
cd /cygdrive/c/inetpub/Telmedia/TM6/productos/
find . -mindepth 1 -maxdepth 1 -type d ! \( -name 'img2' \) -exec rm -r {} \;
find . -type f -delete
#paso 7
echo "Copiando los productos a TM6"
cmd /c "C:\inetpub\Telmedia\scripts\copiar_carpeta.bat"
#paso 8
echo "Realizando sync al servidor Público"
bash /cygdrive/c/inetpub/Telmedia/scripts/sync_publico.sh
#paso 9
echo "Moviendo archivo robots.txt a robots.txt.bkp"
mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt  /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp
#paso 10
echo "Ejecuntando el script Actualizador.sh (con full)"
ssh telmef7x@t1.telmedia.com.mx '/home1/telmef7x/Actualizador.sh --full'
#paso 11
echo "Regresando archivo robots"
mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp  /cygdrive/c/inetpub/Telmedia/TM6/robots.txt









