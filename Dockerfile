FROM node:latest

RUN apt-get update \
    && apt-get install -y wget gnupg ca-certificates procps libxss1 \
    && wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh \
    && chmod +x /usr/sbin/wait-for-it.sh

RUN apt-get update \
    && apt-get install -y certbot python3-certbot-nginx
    
RUN certbot --nginx -d hagap.com.br --email felipeestrela2006@gmail.com
