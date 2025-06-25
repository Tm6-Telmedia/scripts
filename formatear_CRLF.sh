# Verificar si el archivo está en formato LF o CRLF
cd "$(dirname "$0")"
#archivo=Especificaciones.csv
archivo=$1
if file "$archivo" | grep -q 'CRLF'; then
  echo "El archivo está en formato CRLF."
else
  echo "El archivo está en formato LF."
  
  # Convertir de LF a CRLF si es necesario
  echo "Convirtiendo de LF a CRLF..."
  sed 's/$/\r/' "$archivo" > "nuevo.csv"
  mv /cygdrive/c/inetpub/Telmedia/scripts/$archivo /cygdrive/c/inetpub/Telmedia/scripts/${archivo##.}-original.csv
  mv /cygdrive/c/inetpub/Telmedia/scripts/nuevo.csv /cygdrive/c/inetpub/Telmedia/scripts/$archivo
fi
