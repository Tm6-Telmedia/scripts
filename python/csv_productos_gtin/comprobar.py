import csv

with open('productos_actualizados.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row[2] == '18628':
            print(row)
