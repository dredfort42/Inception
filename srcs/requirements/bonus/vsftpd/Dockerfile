FROM debian:buster-slim

RUN apt-get update -y
RUN apt-get install vsftpd -y
RUN apt-get install openssl -y
RUN openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=School21/CN=dredfort.42.fr/emailAddress=dredfort@student.21-school.ru"
RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf ./etc/vsftpd.conf
COPY ./tools/entrypoint.sh ./entrypoint.sh

EXPOSE 21
EXPOSE 2121-2142

CMD bash ./entrypoint.sh
# CMD tail -f