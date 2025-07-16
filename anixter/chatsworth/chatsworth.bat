@echo off
cd c:\cygwin64\bin
set marca=chatsworth
set id=33
c:\cygwin64\bin\bash.exe -l /cygdrive/c/Users/user/Desktop/Anixter/chatsworth/prods.sh %marca% %id%
c:\cygwin64\bin\bash.exe -l  /cygdrive/c/Users/user/Desktop/Anixter/chatsworth/revision.sh %marca%%id%_hoy.tab

