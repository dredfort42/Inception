FROM debian:buster

RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=School21/CN=dredfort.42.fr/emailAddress=dredfort@student.21-school.ru"
COPY ./conf/nginx.conf ./etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]