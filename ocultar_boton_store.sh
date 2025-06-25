#!/bin/bash

start_directory="/cygdrive/c/inetpub/Telmedia/TM6/productos"

# Usar find para encontrar todos los archivos .html y procesarlos
find "$start_directory" -type f -name "*.html" | while read -r file; do
    # Reemplazar \r por \n
    tr '\r' '\n' < "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    # Aplicar sed y verificar si hubo un cambio
    if sed -i.bak 's/<button id="mostrar-formulario">Cotizar Ahora<\/button>/<button id="mostrar-formulario" hidden>Cotizar Ahora<\/button>/' "$file"; then
        if cmp -s "$file" "$file.bak"; then
            echo "Botón no encontrado en $file"
        else
            echo "Botón encontrado y reemplazado en $file"
        fi
        rm "$file.bak" # Eliminar archivo de respaldo si no es necesario
    fi
    
    # Mostrar líneas que contienen '<button id="mostrar'
    grep -F '<button id="mostrar' "$file"
done
