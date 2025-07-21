#!/bin/bash
ssh root@10.240.128.6 "cd /vdisk1/FM6/FMS && git add . && (git diff --cached --quiet || git commit -m 'Archivos actualizados') && git push"
