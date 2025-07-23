#!/bin/bash

# Función Paso 1: Eliminar carpetas de productos en desarrollo
eliminar_carpetas() {
    echo "Eliminado carpetas de productos en desarrollo"
    cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/
    find . -mindepth 1 -maxdepth 1 -type d ! \( -name 'img' -o -name 'img2' -o -name 'brochure' -o -name 'categorias' -o -name 'demo' -o -name 'thumb' -o -name 'thumb2' \) -exec rm -r {} \;

}

# Función Paso 2: Generar productos
generar_productos() {
    echo "Generando los productos"
    sleep 5
    curl http://10.240.128.8:9009/productos-service-prueba-shtml/crearTodosHTML
    echo "El valor del Curl de salida es: "$?
    echo "Productos generados ¿Desea continuar? (S/N)"
    read respuesta
}
# Función Paso 3: Ocultar botón de store y crear menús de productos
crear_menus() {
	if [ -z "$respuesta" ]; then
        respuesta=S
    fi
    if [ "$respuesta" = "S" ] || [ "$respuesta" = "s" ]; then
        echo "Continuando..."
        #echo "Ocultando boton de store"
        #bash /cygdrive/c/inetpub/Telmedia/scripts/ocultar_boton_store.sh
        echo "Creando menus de productos"
		curl http://10.240.128.8:9009/productos-service-prueba-shtml/menu
		cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/listado
		mv */ ..
		rm -rf /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/listado
		rm -rf /cygdrive/c/inetpub/Telmedia/Desarrollo/tmp/
		echo "Creando JSON para el buscador"
		curl http://10.240.128.8:9009/productos-service-prueba-shtml/indexing/all/json
        #bash /cygdrive/c/inetpub/Telmedia/Desarrollo/scripts/menu_por_categorias.sh
        #bash /cygdrive/c/inetpub/Telmedia/scripts/crea_archivo_\(tmp.txt\).sh
        #bash /cygdrive/c/inetpub/Telmedia/scripts/Menu_nuevo.sh
        takeown /R /F /cygdrive/c/inetpub/Telmedia/Desarrollo/productos
		takeown /R /F "C:\inetpub\Telmedia\Desarrollo\productos"
		echo "TM7 Actualizado ¿Desea continuar con TM6? (S/N)"
		read tm7
    else
        echo "Cancelando..."
        exit 1
    fi
}

# Función Paso 4: Actualizar TM6
actualizar_tm6() {
	if [ -z "$tm7" ]; then
        tm7=S
    fi
    if [ "$tm7" = "S" ] || [ "$tm7" = "s" ]; then
        echo "Eliminado carpetas de productos en TM6"
        cd /cygdrive/c/inetpub/Telmedia/TM6/productos/
        find . -mindepth 1 -maxdepth 1 -type f -delete
        #find . -mindepth 1 -maxdepth 1 -type d ! \( -name 'img2' \) -exec rm -r {} \;
		find . -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;

        echo "Copiando los productos a TM6"
        cmd /c "C:\inetpub\Telmedia\scripts\copiar_carpeta.bat"
		echo "Copiando archivo Indexing.json"
		cp /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/assets/json/indexing.json  /cygdrive/c/inetpub/Telmedia/TM6/tm/assets/json/indexing.json
		echo "TM6 Actualizado ¿Desea continuar con el sitio público? (S/N)"
		read tm6
    else
        echo "Cancelando..."
        exit 1
    fi
}

# Función Paso 5: Actualizar sitio público
actualizar_sitio_publico() {
	if [ -z "$tm6" ]; then
        tm6=S
    fi
    if [ "$tm6" = "S" ] || [ "$tm6" = "s" ]; then
        echo "Moviendo archivo robots.txt a robots.txt.bkp"
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/robots.txt root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/
        mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp
        #ssh root@10.240.128.7 '/usr/share/nginx/html/tm4/WGET_TM6.sh'
		ssh root@10.240.128.6 '/usr/share/nginx/html/tm4/WGET_TM6.sh wget'
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/tm/assets/img/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/tm/assets/img/
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/tm/assets/img/service/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/tm/assets/img/service/
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/tm/assets/img/banner/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/tm/assets/img/banner/
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/tm/assets/json/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/tm/assets/json/
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/productos/img2/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/productos/img2/
		#rsync -az /cygdrive/c/inetpub/Telmedia/TM6/tm/ root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/tm/
		rsync -az /cygdrive/c/inetpub/Telmedia/TM6/sitemap.xml root@10.240.128.6:/usr/share/nginx/html/tm4/public_html/
		ssh root@10.240.128.6 'sudo chown -R root:root /usr/share/nginx/html/tm4/ && sudo chmod -R 755 /usr/share/nginx/html/tm4/'
		ssh root@10.240.128.6 '/usr/share/nginx/html/tm4/WGET_TM6.sh tm4'
        echo "Regresando archivo robots"
        mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp /cygdrive/c/inetpub/Telmedia/TM6/robots.txt
		echo "Sitio público Actualizado ¿Desea continuar con W2? (S/N)"
		read publico
    else
        echo "Cancelando..."
        exit 1
    fi
}

# Función Paso 6: Actualizar W2
actualizar_w2() {
	if [ -z "$publico" ]; then
        publico=S
    fi
    if [ "$publico" = "S" ] || [ "$publico" = "s" ]; then
	echo "Actualizando W2"
	    echo "Moviendo archivo robots.txt a robots.txt.bkp"
        mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp
		ssh root@10.240.128.6 'cd /usr/share/nginx/html/tm4/; pwd; python3 cos.py'
		echo "Regresando archivo robots"
        mv /cygdrive/c/inetpub/Telmedia/TM6/robots.txt.bkp /cygdrive/c/inetpub/Telmedia/TM6/robots.txt
    else
        echo "Cancelando..."
        exit 1
    fi
}

# Menú para seleccionar la acción
menu() {
    echo "Seleccione la opción a ejecutar:"
	echo "***********************************************************"
    echo "1. Eliminar carpetas de productos en desarrollo"
    echo "2. Generar productos"
    echo "3. Crear menús"
    echo "4. Actualizar TM6"
    echo "5. Actualizar sitio público"
    echo "6. Actualizar W2.telmedia.com.mx/telmedia.com.mx"
    echo "7. Ejecutar todos los pasos"
    echo "8. Salir"
	echo "***********************************************************"

    read opcion

    case $opcion in
        1) eliminar_carpetas ;;
        2) generar_productos ;;
        3) crear_menus ;;
        4) actualizar_tm6 ;;
        5) actualizar_sitio_publico ;;
        6) actualizar_w2 ;;
        7) 
            eliminar_carpetas
            generar_productos
            crear_menus
            actualizar_tm6
            actualizar_sitio_publico
            actualizar_w2
            ;;
        8) exit 0 ;;
        *) echo "Opción no válida" ;;
    esac
}

# Llamar al menú
while true; do
    menu
done
