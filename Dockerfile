# Use a imagem do Node.js com Certbot
FROM node:latest

# Instale dependências adicionais, incluindo o Certbot e pacotes necessários
RUN apt-get update && \
    apt-get install -y python3 python3-venv libaugeas0 && \
    pip3 install --upgrade pip certbot-dns-cloudflare

# Crie um ambiente virtual para o Certbot
RUN python3 -m venv /opt/certbot/

# Ative o ambiente virtual e execute a instalação do Certbot
RUN /opt/certbot/bin/pip install --upgrade pip && \
    /opt/certbot/bin/pip install certbot && \
    /opt/certbot/bin/pip install certbot-dns-cloudflare

# Execute o Certbot para obter o certificado
RUN /opt/certbot/bin/certbot certonly --dns-cloudflare -d hagap.com.br --email felipeestrela2006@gmail.com --agree-tos

# Adicione comandos adicionais, se necessário, para configurar o certificado nos seus contêineres Docker
