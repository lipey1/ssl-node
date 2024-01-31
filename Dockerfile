# Use a imagem do Node.js com Certbot
FROM node:latest

# Instale dependências adicionais
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install virtualenv certbot-dns-cloudflare

# Crie um ambiente virtual
RUN python3 -m venv /venv

# Ative o ambiente virtual e execute a instalação do Certbot
RUN /venv/bin/activate && \
    pip3 install certbot && \
    certbot plugins && \
    pip3 install certbot-dns-cloudflare

# Execute o Certbot para obter o certificado
RUN /venv/bin/activate && \
    certbot certonly --dns-cloudflare -d hagap.com.br --email felipeestrela2006@gmail.com --agree-tos

# Adicione comandos adicionais, se necessário, para configurar o certificado nos seus contêineres Docker
