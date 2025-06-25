#!/bin/bash

#origen=$(eval echo "~/Documents/GitHub/TM6/")
origen=$(eval echo "/cygdrive/c/inetpub/Telmedia/TM6/")
logfile=$(eval echo "/cygdrive/c/inetpub/Telmedia/scripts/sync_publico.log")
host="telmef7x@t1.telmedia.com.mx"
destino=$(echo "telmef7x@t1.telmedia.com.mx:/home1/telmef7x/public_html/")
#rutas="productos/img/ productos/thumb/ productos/categorias/ productos/brochure/ fabricantes/ tm/assets/"
rutas="productos/img/ productos/thumb/ productos/categorias/ productos/brochure/ fabricantes/ tm/assets/"

echo "Ejecutando Sync hacia servidor Publico $(date)"|tee -a $logfile
echo "Variable ruta1 = $ruta1" |tee -a $logfile

for a in $(echo "$rutas") 
do
cd $origen$a
echo "Procesando $(pwd)" |tee -a $logfile
/usr/bin/rsync -a -v --delete . $destino$a 2>&1 |tee -a $logfile
sleep 12
eval ssh telmef7x@t1.telmedia.com.mx 'chmod -R 755 /home1/telmef7x/public_html/$a; echo permisos cambiados' | tee -a $logfile
sleep 6
done
#Pasando archivo .htaccess
echo "Pasando el archivo .htaccess"
cp /cygdrive/c/inetpub/Telmedia/Desarrollo/.htaccess  /cygdrive/c/inetpub/Telmedia/TM6/.htaccess
/usr/bin/rsync -a -v --delete /cygdrive/c/inetpub/Telmedia/TM6/.htaccess telmef7x@t1.telmedia.com.mx:/home1/telmef7x/public_html/
sleep 10
#cambiando permisos al archivo .htaccess
echo "Cambiando los permisos al a .htaccess"
eval ssh telmef7x@t1.telmedia.com.mx 'chmod -R 644 /home1/telmef7x/public_html/.htaccess; echo permisos cambiados' | tee -a $logfile
sleep 15

echo "Proceso terminado, hora servidor: $(ssh telmef7x@t1.telmedia.com.mx 'date')" | tee -a $logfile

