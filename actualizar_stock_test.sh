#!/bin/bash

sku="$1"
stock="$2"

# Validar parámetros
if [[ -z "$sku" || -z "$stock" ]]; then
  echo "Uso: $0 <sku> <stock>"
  exit 1
fi

echo "SKU: $sku"
echo "Stock: $stock"

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
--header "Cookie: CF_AppSession=na04675bb55db0579; CF_Authorization=$token; wordpress_test_cookie=WP%20Cookie%20check" \
--data "{
  \"sku\": \"$sku\"
}"| jq -r '.[0].id')


# Verificar que se obtuvo el id
if [[ -z "$id" || "$id" == "null" ]]; then
  echo "No se encontró un producto con el SKU: $sku"
  exit 1
fi

# Actualizar stock
response=$(curl -s --location --request PUT "$URL_BASE/wp-json/wc/v3/products/${id}" \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic $AUTH_BASIC" \
  -H "CF-Access-Client-Id: $CLIENT_ID" \
  -H "CF-Access-Client-Secret: $CLIENT_SECRET" \
  -H "Cookie: CF_AppSession=na04675bb55db0579; CF_Authorization=$token; wordpress_test_cookie=WP%20Cookie%20check" \
  --data "{\"stock_quantity\": ${stock}}")

# Confirmar éxito o error
if echo "$response" | jq -e '.id' >/dev/null 2>&1; then
  echo "Stock actualizado para el producto $sku (ID: $id) a $stock unidades."
else
  echo "Error al actualizar el stock. Respuesta:"
  echo "$response"
  exit 1
fi

