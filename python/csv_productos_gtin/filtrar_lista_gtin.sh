#!/bin/bash
ARCHIVO_ENTRADA="gtin.csv"
filtro="filtro.csv"


# Limpiar caracteres \r (de Windows)
sed -i 's/\r$//' "$ARCHIVO_ENTRADA" 

# Filtrar líneas donde la segunda columna NO esté vacía
awk -F',' 'length($2) > 2' "$ARCHIVO_ENTRADA" > "$filtro"

TOTAL=$(wc -l < "$filtro")
echo "Total de filas con segunda columna NO vacía: $TOTAL"
echo "Archivo generado: $filtro"

