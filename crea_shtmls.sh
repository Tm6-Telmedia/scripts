#!/bin/bash
base=/cygdrive/c/inetpub/Telmedia/
dir1=$base/Desarrollo/productos
cd $dir1

#eval find . -name "*.html" -exec \/cygdrive\/c\/inetpub\/Telmedia\/scripts\/crea_shtmls_2.sh \{\} \\;"
find . -name "*.html" -exec $base/scripts/crea_shtmls_2.sh {} \; -exec echo i"shtml procesado" \;
echo "Archivos con posibles problemas" && find . -name *.html -size -200c
