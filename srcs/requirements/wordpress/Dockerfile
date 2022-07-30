FROM debian:buster

RUN apt-get update -y

### php
RUN apt-get install php7.3 -y
RUN apt-get install php-mysqli -y
RUN apt-get install php-fpm -y
RUN mkdir -p ./run/php/
COPY ./conf/www.conf ./etc/php/7.3/fpm/pool.d/www.conf

### wordpress
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ./wp-cli.phar
RUN chmod 777 ./wp-cli.phar
RUN mv ./wp-cli.phar ./usr/bin/wp
RUN wp core download \
    --allow-root \
    --path=./var/www/html/dredfort.42.fr
COPY ./conf/wp-config.conf ./wp-config.php

### adminer
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php ./var/www/html/dredfort.42.fr/adminer/index.php
RUN chmod 777 ./var/www/html/dredfort.42.fr/adminer/index.php

### nophp site
COPY ./tools/site.tar.gz ./mysite/site.tar.gz
RUN tar -xzvf ./mysite/site.tar.gz
RUN rm ./mysite/site.tar.gz
RUN mv ./mysite ./var/www/html/dredfort.42.fr

EXPOSE 9000

COPY ./tools/entrypoint.sh ./entrypoint.sh
CMD bash ./entrypoint.sh