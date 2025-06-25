cd /cygdrive/c/inetpub/Telmedia/Desarrollo/productos2
x=$(find *.pdf)
array=($x)
for i in "${array[@]}"
do
	gs -sDEVICE=pdfwrite -dCompatibility=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp.pdf $i
	mv tmp.pdf $i
done
