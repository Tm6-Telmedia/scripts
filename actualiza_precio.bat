@echo off
setlocal ENABLEEXTENSIONS

rem Verificar cuántos argumentos se pasaron
if "%4"=="" (
    if "%3"=="" (
        echo Uso: %0 ^<sku^> ^<precio_original^> [^<precio_oferta^>] ^<usuario^>
        exit /b 1
    ) else (
        rem Solo se pasaron 3 argumentos: SKU, precio_original, usuario
        set "sku=%1"
        set "pi=%2"
        set "usr=%3"

		\cygwin64\bin\bash.exe -l -c '/cygdrive/c/inetpub/Telmedia/scripts/actualizar_precio.sh $sku $pi $usr'
        exit /b
    )
) else (
    rem Se pasaron 4 argumentos: SKU, precio_original, precio_oferta, usuario
    set "sku=%1"
    set "pi=%2"
    set "po=%3"
    set "usr=%4"
    \cygwin64\bin\bash.exe -l -c '/cygdrive/c/inetpub/Telmedia/scripts/actualizar_precio.sh $sku $pi $po $usr'
)

endlocal
