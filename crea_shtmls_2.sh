#!/bin/bash
for a in "$1"
do
b=${a%.html}
c=${b##*/}
d=${b%$c}
##iconv -f ISO-8859-1 -t UTF-8 "$a" > "/tmp/iso.tmp"
# Ya no es necesario el iconv por correccion de la app
#iconv -f WINDOWS-1252 -t UTF-8 "$a" > "/tmp/iso.tmp"
#cp  "/tmp/iso.tmp" "$a"
#cp /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/ssi/base /tmp/$b.tmp
cp /cygdrive/c/inetpub/Telmedia/Desarrollo/tm/ssi/base "/tmp/$c.tmp"
#sed s/"\[ARCH\]"/"$a"/g "/tmp/$b".tmp > "$d$b".shtml
sed s/"\[ARCH\]"/"$c.html"/g "/tmp/$c".tmp > "$d$c".shtml
#rm /tmp/$b.tmp
rm "/tmp/$c.tmp"
done
