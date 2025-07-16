#!/bin/bash
cd "$(dirname "$0")"
# Verificar que se pase un archivo como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"
num_columnas=8

awk -F'\t' -v columnas="$num_columnas" '
BEGIN {
    errores = 0 # Contador de errores
}

{
    # Verificar si falta alguna columna en la línea
    if (NF != columnas) {
        printf "Error en la línea %d (%s): Faltan columnas: ", NR, $2
        for (i = (NF + 1); i <= columnas; i++) {
            printf i " "
        }
        print ""
        errores++
    }
    
    # Verificar si alguna columna está vacía
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^$/) { # Detecta columnas vacías
            print "Error en la línea " NR " (" $2 "): La columna " i " está vacía."
            errores++
        }
    }
}

END {
    if (errores > 0) {
        print "Se encontraron " errores " errores en total."
        exit 1
    } else {
        print "Todos los registros tienen el número correcto de columnas y no hay columnas vacías."
    }
}' "$archivo"
