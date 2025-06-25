@echo off
:: Configuración de conexión SQL Server
set servidor=fm6
:: Variables
set base_de_datos=TM
set usuario=Luis
set contrasena=WdpL0CHymw$tjZaB!3l^A1m9



:: Vaciado de tabla
echo Vaciado tabla crm
sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "WdpL0CHymw$tjZaB!3l^A1m9" -Q "TRUNCATE TABLE crm;"

:: Formateando archivo
::C:\cygwin64\bin\bash --login -i -c "/cygdrive/c/inetpub/Telmedia/scripts/formatear_CRLF.sh especificaciones.csv"

:: Insertar datos desde CSV
sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "WdpL0CHymw$tjZaB!3l^A1m9" -Q "BULK INSERT [dbo].[crm] FROM 'C:\inetpub\Telmedia\scripts\crm_.tab' WITH (FIELDTERMINATOR = '	', ROWTERMINATOR = '\n', CODEPAGE = '65001')" 


:: Mostrar tabla 
:: sqlcmd -S %servidor% -d %base_de_datos% -U %usuario% -P "%contrasena%" -Q "SELECT * FROM crm;"
