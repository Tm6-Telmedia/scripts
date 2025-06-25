#!/bin/bash
#SCRIPT PARA PONER SELLO DE AGUA A PDFs CONSERVANDO CARACTERISTICAS DE TEXTO
#NOTA: ESTE SCRIPT DE MOMENTO SOLO FUNCIONA EN MACOS

cd ~/Documents/
#find *.pdf -atime -1 > /tmp/nuevos
find ~/Documents/Cotizacion*.pdf -ctime -2m > /tmp/nuevos
cd /tmp
rm *.pdf
for a in $(cat /tmp/nuevos)
do
echo Procesando $a
sleep 2
automator -i $a ~/scripts/PDF/PDF_watermark\ 2.app
sleep 1
done
mv ~/Desktop/*Watermark* /tmp
cd /tmp
bash ~/scripts/PDF/watermark_nombres.sh
mv *.pdf ~/Documents/Cotizaciones/
