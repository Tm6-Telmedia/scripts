@echo off
cd c:\cygwin64\bin
set marca=axis
set id=1
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/axis/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/axis/revision.sh %marca%%id%_hoy.tab