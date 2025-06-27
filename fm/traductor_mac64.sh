#!/bin/bash
#Palabra=\"$@\"
Server=10.240.128.8
Palabra=\"$(echo $1|base64 -d|tr '\r' '^')\"
echo $Palabra
ssh administrator@$Server "traductor.bat $Palabra"
sleep 1
scp administrator@$Server:/inetpub/Telmedia/scripts/traductor/traduccion.txt ~/Documents/txt_Traduccion.txt
sleep 1
