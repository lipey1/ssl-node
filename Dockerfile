# Use a imagem do Node.js com Certbot
FROM node:latest

# Instale dependências adicionais, incluindo o Certbot
RUN apt-get update && \
    apt-get install -y python3 python3-venv libaugeas0 && \
    pip3 install certbot-dns-cloudflare

RUN python3 -m venv /opt/certbot/
RUN /opt/certbot/bin/pip install --upgrade pip
# Execute o Certbot para obter o certificado
RUN certbot certonly --dns-cloudflare -d hagap.com.br --email felipeestrela2006@gmail.com --agree-tos

# Adicione comandos adicionais, se necessário, para configurar o certificado nos seus contêineres Docker

# Adicione comandos específicos do Node.js, se necessário
