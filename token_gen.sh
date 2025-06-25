#@echo off
#c:\cygwin64\bin\bash.exe -l \cygdrive\c\inetpub/Telmedia/scripts

curl -X POST 'https://iam.cloud.ibm.com/identity/token' -H 'Content-Type: application/x-www-form-urlencoded' -d 'grant_type=urn:ibm:params:oauth:grant-type:apikey&apikey=xMA8GekTWGLmS98uQKU7YaIezUDq9wVfHtFgve3Q9jsl' > token.txt

