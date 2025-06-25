#!/usr/bin/env python3
import sys
import base64
import json
import re
import requests
from pathlib import Path

API_KEY = "sk-3246735f8b6746c988f7a950c2f4e23d"
API_URL = "https://api.deepseek.com/chat/completions"
SALIDA = "traduccion.txt"

def is_base64(s):
    # Elimina espacios y saltos de línea para validar bien
    s_clean = ''.join(s.strip().splitlines())
    return re.fullmatch(r'[A-Za-z0-9+/=]+', s_clean) is not None

def main():
    if len(sys.argv) < 2:
        print(f"Uso: {Path(sys.argv[0]).name} <texto a traducir>")
        sys.exit(1)

    # Une todos los argumentos en un solo string
    texto = ' '.join(sys.argv[1:])

    # Si es base64, intentamos decodificar
    if is_base64(texto):
        try:
            texto = base64.b64decode(texto).decode('utf-8')
        except Exception:
            pass  # No hacemos nada si falla

    # Arma el payload
    payload = {
        "model": "deepseek-chat",
        "messages": [
            {"role": "system", "content": "Traduce del inglés al español. No expliques nada. Solo responde con la traducción."},
            {"role": "user", "content": texto}
        ],
        "stream": False
    }

    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }

    # Llamada a la API
    try:
        response = requests.post(API_URL, headers=headers, json=payload)
        response.raise_for_status()
        data = response.json()
        contenido = data['choices'][0]['message']['content']

        # Guarda en archivo
        with open(SALIDA, "w", encoding="utf-8") as f:
            f.write(contenido.strip())

        print(f" Traducción guardada en {SALIDA}")
    except Exception as e:
        print(" Error al traducir:", e)

if __name__ == "__main__":
    main()
