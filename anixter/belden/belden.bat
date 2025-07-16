@echo off
cd c:\cygwin64\bin
set marca=belden
set id=39
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/belden/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/belden/revision.sh %marca%%id%_hoy.tab

