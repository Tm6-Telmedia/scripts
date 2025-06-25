cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos/brochure
archivos=$(find . -name "*.pdf" -type f)
archivos_2=$(find . -name "*.shtml" -type f)
rm -rf index.htm index.shtml
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div hidden>
<ul>' >> index.htm

for i in $archivos
do
  x=$(basename $i)
  echo  '<li><a href="/productos/brochure/'$x'">'$x'</a></li>'>>index.htm
done


for j in $archivos_2
do
  y=$(basename $j)
  echo  '<li><a href="/productos/brochure/'$y'">'$y'</a></li>'>>index.htm
done
echo '
</ul>
</div>
</body>
</html>'>>index.htm


	echo '<!--#include virtual="/tm/pages/header.htm"-->

	<br>

	<!--#include file="index.htm"-->

	<br>

	<!--#include virtual="/tm/pages/footer.htm"-->' >> index.shtml