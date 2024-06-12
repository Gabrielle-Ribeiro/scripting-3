#! /bin/bash

CAMINHO_BACKUP=
CAMINHO_CNF=

data=$(date +%F)
cd $CAMINHO_BACKUP
if [ ! -d $data ]; then
        mkdir $data
fi

tabelas=$(sudo mysql --defaults-extra-file=$CAMINHO_CNF -e "use vollmed_db; show tables;" | grep -v Tables)

for tabela in $tabelas; do
        mysqldump --defaults-extra-file=$CAMINHO_CNF $1 $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://vollmed-bd