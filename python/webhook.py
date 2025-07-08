from flask import Flask, request, abort
import subprocess, requests
app = Flask(__name__)

@app.route('/webhook', methods=['POST'])
def webhook():
    if request.method == 'POST':
        # Guarda el JSON recibido en una variable llamada 'data'
        data = request.json
        print("Datos recibidos: ", data, "\n")
        
        cotizacion_numero = data['resource']['purchase_units'][0]['description']
        print("Cotización Número: ", cotizacion_numero)
        
        # Abre el archivo en modo lectura
        with open('cotizacion.txt', 'r') as archivo:
            contenido = archivo.read()
            lineas = contenido.split('\n')
            
            # Verifica si la cotización se encuentra en el contenido del archivo
            for linea in lineas:
                if cotizacion_numero in linea:
                    ruta=linea.split(',')
                    script_path ="token_cos.py"
                    print("La cotización se encuentra en el archivo")
                    print(ruta[1])
                    x=ruta[1]
                    subprocess.call(["python", script_path])
                    with open('token.txt', 'r') as archivo:
                        token = archivo.read()
                        print(token,"\n")
                        #subinedo archivo de confirmación de pago a cos
                        url="https://s3.us-south.cloud-object-storage.appdomain.cloud/k.telmedia.com.mx/" + x
                        archivo = "confirmacion_pago.html"
                        with open(archivo, "rb") as file:
                            # Configura las cabeceras para la solicitud PUT
                            headers = {
                                'Authorization':token,  # Reemplaza con tu token de autorización
                            }

                            # Utiliza el método PUT para subir el archivo
                            response = requests.put(url, headers=headers, data=file)
                            print(url)
                        
                    
                else:
                    print("La cotización no se encuentra en el archivo")
        
        return 'success', 200
    else:
        abort(400)

if __name__ == '__main__':
    app.run(ssl_context='adhoc', host='0.0.0.0', port=2095, debug=True)


