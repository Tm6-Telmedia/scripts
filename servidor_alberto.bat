
@echo off
set LOGFILE=c:\inetpub\Telmedia\demo\alberto\servidor\server_alberto.log

echo [%date% %time%] Iniciando el script... >> %LOGFILE%
cd c:\inetpub\Telmedia\demo\alberto\servidor

echo [%date% %time%] Ejecutando node servidor.js... >> %LOGFILE%
node servidor.js >> %LOGFILE% 2>&1

if %ERRORLEVEL% equ 0 (
    echo [%date% %time%] servidor.js se inició correctamente. >> %LOGFILE%
) else (
    echo [%date% %time%] ERROR al iniciar servidor.js. Código de error: %ERRORLEVEL% >> %LOGFILE%
)
