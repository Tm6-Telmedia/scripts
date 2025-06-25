#!/bin/bash
cd "$(dirname "$0")"
sku="$1"
precio_original="$2"
precio_oferta="$3"
usuario="$4"
# Validar parámetros
# Validar todos los parámetros
if [[ $# -eq 3 ]]; then
  precio_original="$2"
  usuario="$3"
else
  precio_original="$2"
  precio_oferta="$3"
  usuario="$4"
fi
# Validar los parámetros obligatorios
if [[ -z "$sku" || -z "$precio_original" || -z "$usuario" ]]; then
  echo "Faltan parámetros obligatorios."
  echo "Uso: $0 <sku> <precio_original> <precio_oferta> <usuario>"
  exit 1
fi

# Mostrar los valores
echo "SKU: $sku"
echo "Precio original: $precio_original"

if [[ "$precio_oferta" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Precio oferta: $precio_oferta"
fi

echo "Usuario: $usuario"
# Constantes
URL_BASE="https://store.telmedia.com.mx"
CLIENT_ID="338d95ebbe8b957affb7070ddd0a450f.access"
CLIENT_SECRET="1a0b74830ee1f5997f66500a5cdfb29bd804a9ff8a6ec4da77c2f980230bbc22"
AUTH_BASIC="Y2tfYzU1NTc5Y2ZjOTJiOWJkZWZmMzExYjZlOTJhMjg3YjI2NzRlYThlMjpjc182NjJlMDMxZTdmMDZlMTU2NzAyNDFlZmQwYTUxZDRkMTE1MTRiYjA0"

# Obtener token de sesión
token=$(curl -s -D - -o /dev/null--location  "$URL_BASE/wp-admin/plugins.php" \
-H "CF-Access-Client-Id: $CLIENT_ID"  \
-H "CF-Access-Client-Secret: $CLIENT_SECRET"  | grep -i Set-Cookie  \
  | grep -i 'Set-Cookie: CF_Authorization=' \
  | cut -d'=' -f2- \
  | cut -d';' -f1)
  

# Buscar ID del producto por SKU
id=$(curl --location --request GET "$URL_BASE/wp-json/wc/v3/products" \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic Y2tfYzU1NTc5Y2ZjOTJiOWJkZWZmMzExYjZlOTJhMjg3YjI2NzRlYThlMjpjc182NjJlMDMxZTdmMDZlMTU2NzAyNDFlZmQwYTUxZDRkMTE1MTRiYjA0' \
--data "{
  \"sku\": \"$sku\"
}"| jq -r '.[0].id')



# Construir el JSON dinámicamente
if [[ -n "$precio_oferta" ]]; then
  json_data="{\"regular_price\": \"${precio_original}\", \"sale_price\": \"${precio_oferta}\"}"
else
  json_data="{\"regular_price\": \"${precio_original}\", \"sale_price\": null}"
fi

# Actualizar precio
response=$(curl -s --location --request PUT "$URL_BASE/wp-json/wc/v3/products/${id}" \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic $AUTH_BASIC" \
  -H "CF-Access-Client-Id: $CLIENT_ID" \
  -H "CF-Access-Client-Secret: $CLIENT_SECRET" \
  -H "Cookie: CF_AppSession=na04675bb55db0579; CF_Authorization=$token; wordpress_test_cookie=WP%20Cookie%20check" \
   --data "$json_data")
# Confirmar éxito o error

if echo "$response" | jq -e '.id' >/dev/null 2>&1; then
  if [[ "$precio_oferta" =~ ^[0-9]+([.][0-9]+)?$ ]]; then

	echo "$(date '+%Y-%m-%d %H:%M:%S') - Precio actualizado por el usuario $usuario para el producto SKU:$sku (ID: $id) precio normal: \$$precio_original → precio en oferta: \$$precio_oferta" 
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Precio actualizado por el usuario $usuario para el producto SKU:$sku (ID: $id) precio normal: \$$precio_original → precio en oferta: \$$precio_oferta" >> status_precio.log
  else

	echo "$(date '+%Y-%m-%d %H:%M:%S') - Precio actualizado por el usuario $usuario para el producto SKU:$sku (ID: $id) precio normal: \$$precio_original " 
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Precio actualizado por el usuario $usuario para el producto SKU:$sku (ID: $id) precio normal: \$$precio_original " >> status_precio.log
  fi
else
  echo "Error al actualizar el precio. Respuesta:"
  echo "$response"
  exit 1
fi

