# Use a imagem oficial do Nginx
FROM nginx:stable-alpine

# O diretório de trabalho padrão do Nginx é /etc/nginx

# Adicione esta linha para instalar openssl
RUN apk add --no-cache openssl

# Remove o arquivo de configuração padrão do Nginx para evitar conflitos
RUN rm /etc/nginx/conf.d/default.conf || true # O '|| true' evita erro se o arquivo já não existir

# Copia a sua configuração personalizada do Nginx para o local correto
COPY nginx.conf /etc/nginx/nginx.conf

# Copia o script de entrada para um local conhecido no PATH e o torna executável
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# A pasta de certificados será mapeada via volume do docker-compose,
# então não precisamos COPY os certificados aqui, apenas garantir que o Nginx saiba o caminho.

# Expõe as portas que o Nginx vai escutar
EXPOSE 80 443

# Define o script de entrada como o ponto de entrada do contêiner
# Este script será executado quando o contêiner iniciar.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# O CMD padrão do Nginx não é necessário aqui, pois o ENTRYPOINT já vai iniciar o Nginx.
# No entanto, se o entrypoint.sh fosse mais simples, poderíamos ter:
# CMD ["nginx", "-g", "daemon off;"]