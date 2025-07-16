@echo off
cd c:\cygwin64\bin
set marca=corning
set id=40
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/corning/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/corning/revision.sh %marca%%id%_hoy.tab
