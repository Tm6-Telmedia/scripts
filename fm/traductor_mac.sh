#!/bin/bash
Palabra=\"$@\"
echo $Palabra
sleep 3
#cd /cygdrive/c/Users/maldo/RepositoriodeGitHub/karoll/

curl -X POST -u "apikey:Grklov-EtmfQIqs1VSGkodp_uztp4dG2DOxFTyXt8Ha7" --header "Content-Type: application/json" --data "{\"text\": [$Palabra ], \"model_id\":\"en-es\"}" "https://api.us-south.language-translator.watson.cloud.ibm.com/instances/6ed0b8ea-ec90-4c97-b563-bbe1ff3b0d08/v3/translate?version=2018-05-01"  > /tmp/txt_Traduccion.json
grep "\"translation\"" /tmp/txt_Traduccion.json|cut -d":" -f2|sed s/^\ \"//g|sed s/\"$//g > ~/Documents/GitHub/karoll/txt_Traduccion.txt
