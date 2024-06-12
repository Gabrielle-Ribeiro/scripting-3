#! /bin/bash

codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null http://IP_INSTANCIA/medicos --connect-timeout 5)

if [ "$codigo_http" -ne 200 ]; then
    remetente=
    destinatario=
    senha=
    assunto="ALERTA: API VollMed fora do ar"
    corpo="Subject: $assunto\n\nA aplicação VollMed retornou o status http ($codigo_http). Favor verificar servidor."

    curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
            --mail-from $remetente \
            --mail-rcpt $destinatario \
            --user $remetente:$senha \
            -T <(echo -e "$corpo")
fi