#!/bin/bash
cd "$(dirname "$0")"
salida="resultado.csv"

echo "sku,nota,precio,moneda,stock" > "$salida"

shopt -s nullglob  # evita errores si no hay archivos
for archivo in *.htm *.html; do
    echo "Procesando $archivo..."

    grep -oP '<div class="text-xs flex flex-col p-1 text-zinc-600">.*?</div>' "$archivo" | cut -d'>' -f5 | cut -d'<' -f1 > sku.tmp
    grep -oP '<div class="flex flex-col p-1">.*?</div>' "$archivo" | cut -d'>' -f3 | cut -d'<' -f1 | sed 's/\$//g' > precio.tmp
    grep -oP '<span[^>]*class="mx-1"[^>]*>\K[^<]+' "$archivo" | grep 'total:' | grep -oP '\d+' > stock.tmp

    registros=$(paste sku.tmp precio.tmp stock.tmp | awk -F'\t' '
    {
        linea = $1
        pos = index(linea, " ")
        if (pos > 0) {
            first = substr(linea, 1, pos - 1)
            rest = substr(linea, pos + 1)
        } else {
            first = linea
            rest = ""
        }

        if (rest == "POR METRO" || rest == "POR PIEZA" || rest == "POR CAJA" || rest == "A GRANEL") {
            sku = first
            nota = rest
        } else {
            sku = linea
            nota = ""
        }

        precioCompleto = $2
        gsub(/,/, "", precioCompleto)

        match(precioCompleto, /^[0-9.]+/)
        precio = substr(precioCompleto, RSTART, RLENGTH)

        moneda = substr(precioCompleto, RSTART + RLENGTH)
        gsub(/^ +| +$/, "", moneda)

        print sku "," nota "," precio "," moneda "," $3
    }')

    count=$(echo "$registros" | wc -l)
    echo "$archivo: $count registros encontrados"
    echo "SKUs encontrados:"
    echo "$registros" | cut -d',' -f1 | sed 's/^/  - /'
    echo

    echo "$registros" >> "$salida"
done
shopt -u nullglob

rm -f sku.tmp precio.tmp stock.tmp
echo "CSV generado: $salida"

sed 's/USD/2/g' < resultado.csv | sed 's/MXN/1/g' | awk '{print $0",39,728,2"}' > tecnosinergia.csv
rm resultado.csv
