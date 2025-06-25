#!/bin/bash
cd "$(dirname "$0")"
cd /cygdrive/c/inetpub/Telmedia/Desarrollo/
directorios=$(find productos/ -mindepth 1 -maxdepth 1 -type d -not -name 'img' -not -name 'img2' -not -name 'thumb' -not -name 'brochure' -not -name 'categorias' -not -name 'js')
for dir in $directorios; do
  echo "Contenido de $dir:"
  ls "$dir"
done