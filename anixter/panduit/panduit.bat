@echo off
cd c:\cygwin64\bin
set marca=panduit
set id=42
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/panduit/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/panduit/revision.sh %marca%%id%_hoy.tab

