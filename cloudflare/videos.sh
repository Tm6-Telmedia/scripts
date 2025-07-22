#!/bin/bash

# Obtener la ruta del directorio del script
directorio_script=$(dirname "$0")

# Recorrer todos los archivos mp4 en el directorio y subirlos con curl
for archivo in "$directorio_script"/*.mp4; do
    if [ -f "$archivo" ]; then
        nuevo_nombre=$(echo "$archivo" | tr ' ' '_')
        mv "$archivo" "$nuevo_nombre"
        x=$(echo $nuevo_nombre)
        output=$(curl -X POST -H "Authorization: Bearer KqQaIN5cKq1x76kC66BvAO0UWZ--tXYOtKPkxOxw" -F "file=@$x" "https://api.cloudflare.com/client/v4/accounts/5013abfc12f99468833bc416f349cfe9/stream")
        url_preview=$(echo "$output" | jq -r '.result.preview')
        echo "Video: ""$x" "Link: ""$url_preview" >> links.txt
    fi
done
