@echo off
setlocal enabledelayedexpansion

:: Une todos los argumentos en una sola variable
set texto=
:loop
if "%~1"=="" goto ejecuta
set texto=!texto! %~1
shift
goto loop

:ejecuta
:: Ejecuta Bash pasando el texto limpio sin comillas
\cygwin64\bin\bash.exe -l -c "/cygdrive/c/inetpub/Telmedia/scripts/sube_productos.sh \"%texto:~1%\""
