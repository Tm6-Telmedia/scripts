import csv

sku_buscado = input("Introduce el SKU que deseas buscar: ")

with open('productos_actualizados.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row[2] == sku_buscado:
            print(row)
