FROM debian:buster-slim

RUN apt-get update -y
RUN apt-get install php7.3 -y
RUN apt-get install php-mysqli -y
RUN apt-get install php-fpm -y
RUN mkdir ./run/php/ -p
RUN mv ./etc/php/7.3/fpm/pool.d/www.conf ./etc/php/7.3/fpm/pool.d/www.conf.___old
COPY ./conf/php.conf ./etc/php/7.3/fpm/pool.d/www.conf

ADD https://wordpress.org/wordpress-6.0.tar.gz ./var/www/html/
RUN tar -xzf ./var/www/html/wordpress-6.0.tar.gz
RUN rm ./var/www/html/wordpress-6.0.tar.gz
RUN mv -f ./wordpress/* ./var/www/html/
RUN rm -rf ./wordpress/
COPY ./conf/wp.conf ./var/www/html/wp-config.php

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php ./var/www/html/adminer/index.php
RUN chmod 777 ./var/www/html/adminer/index.php

EXPOSE 9000

CMD /usr/sbin/php-fpm7.3 -F