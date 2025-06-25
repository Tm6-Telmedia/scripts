#!/bin/bash
#SCRIPT PARA PONER SELLO DE AGUA A PDFs CONSERVANDO CARACTERISTICAS DE TEXTO
#NOTA: ESTE SCRIPT DE MOMENTO SOLO FUNCIONA EN MACOS

cd ~/Documents/GitHub/TM6/productos/brochure
#find *.pdf -atime -1 > /tmp/nuevos
find ~/Documents/GitHub/TM6/productos/brochure/*.pdf -atime -1 > /tmp/nuevos
cd /tmp
rm *.pdf
for a in $(cat /tmp/nuevos)
do
echo Procesando $a
sleep 2
# automator 2 pone dos sellos, automator 3 solo pone el arco
automator -i $a ~/scripts/PDF/PDF_watermark\ 3.app
sleep 1
done
mv ~/Desktop/*Watermark* /tmp
cd /tmp
bash ~/scripts/PDF/watermark_nombres.sh
mv *.pdf ~/Documents/GitHub/TM6/productos/brochure/
