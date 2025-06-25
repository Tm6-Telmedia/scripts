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
sleep 5
curl http://10.240.128.8:9009/productos-service/crearTodosHTML
echo "El valor del Curl de salidad es: "$?
echo "Productos generados ¿Desea continuar? (S/N)"
read respuesta
if [ "$respuesta" = "S" ] || [ "$respuesta" = "s" ]; then
		echo "Continuando..."
		#paso3 
		#echo "Generando los shtml's de los productos"
		#bash /cygdrive/c/inetpub/Telmedia/scripts/crea_shtmls.sh
		#paso 4
		#echo "Creando menus de marcas"
		#bash /cygdrive/c/inetpub/Telmedia/Desarrollo/scripts/menu_fabricantes.sh
		echo "Ocultando boton de store"
		bash /cygdrive/c/inetpub/Telmedia/scripts/ocultar_boton_store.sh
		#paso 5
		echo "Creando menus de productos"
		bash /cygdrive/c/inetpub/Telmedia/Desarrollo/scripts/menu_por_categorias.sh
		bash /cygdrive/c/inetpub/Telmedia/scripts/crea_archivo_\(tmp.txt\).sh
		bash /cygdrive/c/inetpub/Telmedia/scripts/Menu_nuevo.sh
		#PARA EVITAR ERRORES EN PROPIETARIO DE PRODUCTOS - CEHCAR
		takeown /R /F /cygdrive/c/inetpub/Telmedia/Desarrollo/productos
		echo "TM7 Actualizado ¿Desea continuar con TM6? (S/N)"
		read tm7
		if [ "$tm7" = "S" ] || [ "$tm7" = "s" ]; then
			#paso 6
			echo "Eliminado carpetas de productos en TM6"
			cd /cygdrive/c/inetpub/Telmedia/TM6/productos/
			find . -mindepth 1 -maxdepth 1 -type f -delete
			find . -mindepth 1 -maxdepth 1 -type d ! \( -name 'img2' \) -exec rm -r {} \;
			#paso 7
			echo "Copiando los productos a TM6"
			cmd /c "C:\inetpub\Telmedia\scripts\copiar_carpeta.bat"
		else
			echo "Cancelando..."
			exit 1
		fi
		echo "TM6 Actualizado ¿Desea continuar con el sitio público? (S/N)"
		read tm6
		if [ "$tm6" = "S" ] || [ "$tm6" = "s" ]; then		
		#paso 8
			echo "Moviendo archivo robots.txt a robots.txt.bkp"
			mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt  /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp
			ssh root@10.240.128.7 '/usr/share/nginx/html/tm4/super_script.sh'
			#paso 9
			#echo "Ejecuntando el script Actualizador.sh (con full)"
			#ssh telmef7x@t1.telmedia.com.mx '/home1/telmef7x/Actualizador_2.sh --full'
			#paso 10
			echo "Regresando archivo robots"
			mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp  /cygdrive/c/inetpub/Telmedia/TM6/robots.txt
			#paso 11
			#echo "Realizando sync al servidor Público"
			#bash /cygdrive/c/inetpub/Telmedia/scripts/sync_publico.sh
		else
			echo "Cancelando..."
			exit 1

		fi
		echo "Sitio público Actualizado ¿Desea continuar con W2? (S/N)"
		read publico
		if [ "$publico" = "S" ] || [ "$publico" = "s" ]; then	
			
			ssh root@10.240.128.7 'cd /usr/share/nginx/html/tm4/; pwd; sh subir_archivos_cos.sh'
		else
			echo "Cancelando..."
		exit 1
		fi

else
		echo "Cancelando..."
		exit 1

fi











