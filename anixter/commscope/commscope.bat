@echo off
cd c:\cygwin64\bin
set marca=commscope
set id=304
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/commscope/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/commscope/revision.sh %marca%%id%_hoy.tab

