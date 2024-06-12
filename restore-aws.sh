#! /bin/bash

CAMINHO_RESTORE=
CAMINHO_CNF=

aws s3 sync s3://vollmed-bd/$1 $CAMINHO_RESTORE

cd $CAMINHO_RESTORE
if [ -f $2.sql ]; then
        mysql --defaults-extra-file=$CAMINHO_CNF vollmed_db < $2.sql
        if [ $? -eq 0 ]; then
                echo "Os dados foram restaurados com sucesso!"
        else
                echo "Houve um erro durante a restauracao dos dados."
        fi
else
        echo "O arquivo procurado nao existe no diretorio"
fi