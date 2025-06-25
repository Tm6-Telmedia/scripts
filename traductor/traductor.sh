#!/bin/bash
cd "$(dirname "$0")"
# Verifica que se haya proporcionado texto
if [ "$#" -lt 1 ]; then
  echo "Uso: $0 <texto a traducir>"
  exit 1
fi

# Junta todos los argumentos
TEXTO="$*"

# Detecta si es Base64 válido
is_base64() {
  echo "$1" | grep -Eq '^[A-Za-z0-9+/=]+$' || return 1
  echo "$1" | base64 -d &> /dev/null || return 1
  return 0
}

# Si parece base64 y se puede decodificar, lo decodificamos
if is_base64 "$TEXTO"; then
  TEXTO=$(echo "$TEXTO" | base64 -d)
fi

# Escapa saltos de línea y comillas para JSON
ESCAPED_TEXT=$(printf "%s" "$TEXTO" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')

# Tu clave de API
API_KEY="sk-3246735f8b6746c988f7a950c2f4e23d"

# Realiza la solicitud a la API
curl -s https://api.deepseek.com/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "{
        \"model\": \"deepseek-chat\",
        \"messages\": [
          {\"role\": \"system\", \"content\": \"Traduce del inglés al español. No expliques nada. Solo responde con la traducción.\"},
          {\"role\": \"user\", \"content\": \"$ESCAPED_TEXT\"}
        ],
        \"stream\": false
      }" | jq -r '.choices[0].message.content' > traduccion.txt
