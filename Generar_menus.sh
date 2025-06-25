#!/bin/bash
rm -rf index.shtml  index.htm
base=$(cat /C/inetpub/Telmedia/scripts/icon/base_menu.txt)
echo $base >> index.htm
dir=$(pwd)
x=$(pwd| cut -d "/" -f7- --output-delimiter=$'-'|sed -e "s/\b\(.\)/\u\1/g")
y=$( pwd| cut -d "/" -f6- --output-delimiter=$'/')
z=$(pwd| cut -d "/" -f6-8 --output-delimiter=$'/')
nodir=$( ls  -p | grep "/" | wc -l)
nodir2=$(ls  -p | grep "/"| tr "/" "\n")
echo "<title>""Telmedia-Productos-"$x "</title>" >> index.htm
echo "<h1>" $x "</h1>" >> index.htm
echo '<div class="vertical-menu"> ' >> index.htm
cd ..
dir2=$(pwd |cut -d "/" -f6- --output-delimiter=$'/')
cd "$dir"
echo '<a href="'/$dir2/index.shtml '"''class="glyphicon glyphicon-arrow-left">' '</a>'>> index.htm
archivos=$(find *.shtml)
array=($archivos)
array2=($nodir2)

if [[ $nodir > 0 ]]
then
for j in */
do
n=$(echo $j |cut -d "/" -f1- --output-delimiter=$' ') 
echo '<a href="'/$y/$j'index.shtml''">' $n '</a>' >> index.htm
done
for i in "${array[@]}"
do
nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
b=${nombre%.shtml}
echo '<a href="'/$y/$i'">' $b '</a>' >> index.htm
done
else

for i in "${array[@]}"
do
nombre=$(echo $i| cut -d "_" -f1- --output-delimiter=$' '|cut -d "-" -f1- --output-delimiter=$' ')
b=${nombre%.shtml}
echo '<a href="'/$y/$i'">' $b '</a>' >> index.htm
done
fi

echo '</div>
</center>
</body>
</html>
'>> index.htm

echo '<!--#include virtual="/tm/pages/header.htm"-->
<br>
<!--#include file="index.htm"-->
<br>
<!--#include virtual="/tm/pages/footer.htm"-->' >> index.shtml
read -n1 -r -p "Index creado, pulsa cualquier tecla para salir..." key
