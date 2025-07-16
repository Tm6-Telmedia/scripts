#!/bin/bash
#IDS=
# Axis -1
# Belden 39
# Corning 40
# Systimax 24
# Fluke 41
# APC 51
cd "$(dirname "$0")"
mkdir -p tmp
rm -rf *.tab
if [ $# -lt 2 ]
then 
echo Uso: prods.sh [nombre_fabricante] [id_fabricante]
exit 1
fi

#b=reinicio a uno para archivos
b=1
# c=Nombre fabricante (1 word)
c=$1
#d=Fabricante ID
d=$2
rm tmp/*.[0-9] tmp/*.[0-9][0-9] tmp/*.tab tmp/*.tmp tmp/*_val 2>/dev/null
for a in *.mhtml
do
echo $b - $a
#PARTNUM
#Opción aun no lista con htmltree: grep  -A3 "MFR PART" 2.tmp|grep \"\ \ |awk '{print $2 "_"}'|tr  -cd "[:print:]" |tr '_' '\n'
#
grep -A3 "MFR PART" $a |grep -n nbsp|cut -d";" -f2|cut -d"<" -f1 > tmp/${c}_pn.$b
PN=$(cat tmp/${c}_pn.$b|wc -l|sed s/\ //g)
wc -l tmp/${c}_pn.$b
sleep 2
#STOCK
grep "in stock" $a |cut -d">" -f2|cut -d"<" -f1| awk '{print $1"\t"$2}'|sed s/"Feet"/"FT"/g|sed s/"Each"/"EA"/g > tmp/${c}_qt.$b
wc -l tmp/${c}_qt.$b
#CANTIDAD
QT=$(cat tmp/${c}_qt.$b|wc -l|sed s/\ //g)
sleep 2
$PRECIO
#grep "data-price=3D" $a |cut -d"$" -f2 | cut -d"\"" -f1 > tmp/${c}_pr.$b
grep "data-product-unit-price=3D" $a |cut -d"\"" -f4|sed s/"="//g|tr -d '\r' | grep -P '[[:print:]]' > tmp/${c}_pr.$b
wc -l tmp/${c}_pr.$b
PR=$(cat tmp/${c}_pr.$b|wc -l|sed s/\ //g)
#NOMBRE
#opción incompleta con htmltree: grep -A1 "3D&quot;title-primary&quot;" 2.tmp|grep -v "\-\-"|grep -v id |cut -d \" -f 2|sed s/^\ //g|sed s/"\.\.\."//g
#SCRIPT normal:
grep -A1 "class=3D\"title-primary" $a| sed 's/--\($\)/##\1/' |grep -v "class=3D\"title-primary"|awk '!/##/'|sed 's/=//'| sed 's/\<\/p\>//g'|sed s/\ \ \ /\ /g|sed s/\ \ //g|sed s/\ \ //g|tr -d '\r' | grep -P '[[:print:]]' > tmp/${c}_nm.${b}_val
#TRUCO para juntar las líneas:
#grep -A2 "class=3D\"title-primary" $a| sed 's/--\($\)/##\1/'|awk '!/##/'|grep -v -F 'class=3D"title-primary"'  |tr '\r' '\n' > tmp/$b.tmp  #aqui
grep -A2 "class=3D\"title-primary" $a| sed 's/--\($\)/##\1/'|awk '!/##/'|grep -v -F 'class=3D"title-primary"' | grep -v '<p '   |tr '\r' '\n'> tmp/$b.tmp 


IFS='
'
#set -f
printf "%s:%s \n" $(cat tmp/$b.tmp)|sed s/\=\://g|sed s/"  "//g|sed s/"\<\/p\>"//g |sed s/"\<\/div\>"//g|sed s/\=$//g| tr '\t' ' '| sed s/\=\ $//g | sed 's/>://g' | sed -E 's|</p||g; s|</div>||g' |sed 's/>//g'> tmp/${c}_nm.$b
echo PROVISIONAL
cat tmp/${c}_nm.$b

echo ESPERANDO , ctrl-C cancelar
sleep 2
IFS=$' \t\n\C-@'

#ls -l tmp/${c}_xname.$b
wc -l tmp/${c}_nm.$b
NM=$(cat tmp/${c}_nm.${b}_val|wc -l|sed s/\ //g)
sleep 2
#echo "'b' vale ahora: " $b
echo PR=$PR QT=$QT PN=$PN NM=$NM
sleep 3

if eval [ $PR -eq $QT ] && [ $QT -eq $PN ] && [ $PN -eq $NM ]
then
{
echo Archivos coinciden
paste tmp/*.$b > tmp/$b.tab
ls -l tmp/$b.tab
b=$(( $b+1 ))
}
else
{
echo Hay discrepancias en los archivo, revisar: PN=$PN, PR=$PR, QT=$QT
echo Cancelando 
exit 1
}
fi

done
# Lista de productos, + id_moneda(2),id_fabricante($d),id_proveedor(3)

cat tmp/*.tab | awk -v d=$d  '{print $0"\t2\t"d"\t3"}'|sed s/" Each in stock"//g > ${c}_hoy.tab
rm tmp/${c}* tmp/*.tab tmp/*.tmp tmp/*_val
echo Proceso terminado
echo posibles errores/duplicados:
cut -f2 ${c}_hoy.tab|sort|uniq -d
echo
echo Unidades encontradas:
cat ${c}_hoy.tab|awk -F'\t' '{print $5}'|sort|uniq
sed -i 's/<\/div>//' ${c}_hoy.tab
sed -i 's/<\/p>//' ${c}_hoy.tab
mv ${c}_hoy.tab ${c}${d}_hoy.tab
#Agregando ultima columna con el dato 2
awk -F'\t' '{ print $0 "\t2" }' ${c}${d}_hoy.tab > tmp.tab
mv tmp.tab ${c}${d}_hoy.tab

original="${c}${d}_hoy.tab"
archivo_sin_duplicar="archivo_sin_duplicar.tab"
archivo_duplicado="archivo_duplicado.tab"

# Procesar el archivo con awk
awk -F '\t' '
{
    # Filtrar líneas donde la columna 4 sea igual a cero
    if ($4 == 0) {
        next
    }
    if (seen[$2]++) {
        # Si es duplicado, imprimir en pantalla y guardar en duplicados
        print "Duplicado: " $0
        print $0 >> "'$archivo_duplicado'"
    } else {
        # Si es único, guardar en el archivo único
        print $0 >> "'$archivo_sin_duplicar'"
    }
}
' "$original"

echo "Archivo procesado:"
echo "- Archivo original guardado en $original"
echo "- Archivo sin datos duplicados $archivo_sin_duplicar"
echo "- Archivo solo con duplicados $archivo_duplicado"




#awk -F '\t' '!seen[$2]++' "${c}${d}_hoy.tab" > tmp.tab
