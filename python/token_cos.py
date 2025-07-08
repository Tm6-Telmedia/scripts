import http.client
import json

conn = http.client.HTTPSConnection("iam.cloud.ibm.com")
payload = "grant_type=urn:ibm:params:oauth:grant-type:apikey&apikey=afKHs3R7X9N_4W7qERTX8c6o3oBUMWlQ-h1_jZvz2M1y"
headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
}
conn.request("POST", "/identity/token", payload, headers)
res = conn.getresponse()
data = res.read()

# Analizar la respuesta JSON
response_data = json.loads(data.decode("utf-8"))

# Obtener el token de acceso
token = response_data.get('access_token', '')
token = "Bearer " + token

# Imprimir el token sin "TOKEN:"
#print(token)
# Escribe el token en un archivo de texto
with open('token.txt', 'w') as archivo:
    archivo.write(token)