if scp -P 65002 $1 u663923825@148.135.132.87:/home/u663923825/domains/store.telmedia.com.mx/public_html/
then
scp -P 65002 $1 u663923825@148.135.132.87:/home/u663923825/domains/store4.telmedia.com.mx/public_html/
scp $1 root@10.240.128.6:/var/www/store/
echo Subida de CSV OK 1>&2
else
echo Subida de CSV falló 1>&2
fi

