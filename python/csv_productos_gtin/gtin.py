import csv

# Cargar datos del filtro en un diccionario
filtro_dict = {}
with open('gtin.csv', newline='', encoding='utf-8') as filtrofile:
    filtro_reader = csv.reader(filtrofile)
    for row in filtro_reader:
        filtro_dict[row[0]] = row[1]

# Abrir archivo de salida
with open('productos_actualizados.csv', 'w', newline='', encoding='utf-8') as outfile:
    writer = csv.writer(outfile)

    # Leer productos y escribir resultado
    with open('productos.csv', newline='', encoding='utf-8') as productosfile:
        reader = csv.reader(productosfile)
        for row in reader:
            clave = row[2]
            if clave in filtro_dict:
                row.append(filtro_dict[clave])
            else:
                row.append('')
            writer.writerow(row)
