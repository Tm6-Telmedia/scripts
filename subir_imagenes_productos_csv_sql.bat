@echo off
:: Configuración de conexión SQL Server
set servidor=fm6
:: Variables
set base_de_datos=TM
set usuario=Luis
set contrasena=WdpL0CHymw$tjZaB!3l^A1m9

:: Obtener la fecha en formato "dd-MM-yyyy HH:mm"
for /f "delims=" %%a in ('powershell -Command "(Get-Date).ToString('dd-MM-yyyy HH:mm')"') do set fecha=%%a

:: Vaciado de tabla
echo Vaciado tabla Especificaciones_productos
sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "WdpL0CHymw$tjZaB!3l^A1m9" -Q "TRUNCATE TABLE imagenes;"

:: Formateando archivo
C:\cygwin64\bin\bash --login -i -c "/cygdrive/c/inetpub/Telmedia/scripts/formatear_CRLF.sh imagenes_productos.csv"

:: Cambiando de directorio
cd C:\inetpub\Telmedia\scripts\

:: Escribir mensaje en el log usando PowerShell
powershell -Command "Add-Content -Path 'C:\inetpub\Telmedia\scripts\log_SQL.txt' -Value ('%fecha% - Ejecución del BULK INSERT iniciada')"

:: Insertar datos desde CSV
sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "WdpL0CHymw$tjZaB!3l^A1m9" -Q "BULK INSERT [dbo].[imagenes] FROM 'C:\inetpub\Telmedia\scripts\imagenes_productos.csv' WITH (FIELDTERMINATOR = '|', ROWTERMINATOR = '\n', CODEPAGE = '65001')" >> "C:\inetpub\Telmedia\scripts\log_SQL.txt"
:: Escribir mensaje en el log usando PowerShell
powershell -Command "Add-Content -Path 'C:\inetpub\Telmedia\scripts\log_SQL.txt' -Value ('-------------------------------------------------------------')"

:: Mostrar tabla 
:: sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "%contrasena%" -Q "SELECT * FROM Especificaciones_productos;"
