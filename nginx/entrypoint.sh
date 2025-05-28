#!/bin/sh
# Arquivo: /nginx/entrypoint.sh

# A chave privada do Nginx está mapeada para /etc/nginx/certs/server_key.pem
# e a senha está em SERVER_KEY_PASSPHRASE

# Verifica se a variável de ambiente com a senha existe
if [ -z "$SERVER_KEY_PASSPHRASE" ]; then
    echo "Erro: SERVER_KEY_PASSPHRASE não definida! Não é possível iniciar o Nginx."
    exit 1
fi

echo "Descriptografando a chave privada do Nginx..."

# Descriptografa a chave privada com a senha e a salva em um arquivo temporário
# para que o Nginx possa lê-la sem pedir senha.
# Use um pipe para evitar que a senha apareça nos logs de comandos.
echo "$SERVER_KEY_PASSPHRASE" | openssl rsa -in /etc/nginx/certs/server_key.pem -out /tmp/server_key_unencrypted.pem -passin stdin

# Verifica se a descriptografia foi bem-sucedida
if [ $? -ne 0 ]; then
    echo "Erro: Falha ao descriptografar a chave privada do servidor Nginx!"
    # Opcional: rm /tmp/server_key_unencrypted.pem
    exit 1
fi

echo "Chave privada descriptografada com sucesso. Iniciando Nginx..."

# Inicia o Nginx, apontando para a chave descriptografada
# Certifique-se de que seu nginx.conf aponte para /tmp/server_key_unencrypted.pem
exec nginx -g "daemon off;"