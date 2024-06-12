#! /bin/bash

CAMINHO_BACKUP=

mysqldump -u root -p"root" $1 > $CAMINHO_BACKUP/$1.sql

if [ $? -eq 0 ]; then
        echo "Backup realizado com sucesso!"
else
        echo "Houve um problema no backup."
fi