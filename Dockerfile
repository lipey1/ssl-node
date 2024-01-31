# Use a imagem do Certbot
FROM certbot/certbot:latest

# Instale dependências adicionais, se necessário
# Execute o Certbot para obter o certificado
RUN certbot certonly --dns cloudflare -d hagap.com.br --email felipeestrela2006@gmail.com --agree-tos

# Adicione comandos adicionais, se necessário, para configurar o certificado nos seus contêineres Docker
