@echo off
cd c:\cygwin64\bin
set marca=fluke
set id=41
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/fluke/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/fluke/revision.sh %marca%%id%_hoy.tab

