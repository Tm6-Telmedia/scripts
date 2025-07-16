@echo off
cd c:\cygwin64\bin
set marca=apc
set id=51
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/apc/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/apc/revision.sh %marca%%id%_hoy.tab