FROM nginx:stable

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=School21/CN=dredfort.42.fr/emailAddress=dredfort.42@gmail.com"
COPY conf /etc/nginx/conf.d/default.conf

EXPOSE 443