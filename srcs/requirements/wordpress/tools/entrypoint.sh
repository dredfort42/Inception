if [ ! -f /var/www/html/dredfort.42.fr/wp-config.php ]
then
    mv wp-config.php /var/www/html/dredfort.42.fr/wp-config.php

    cd /var/www/html/dredfort.42.fr

    wp core install --allow-root \
        --url=${DOMAIN_NAME} \
        --title=${WORDPRESS_NAME} \
        --admin_user=${WORDPRESS_ROOT} \
        --admin_password=${WORDPRESS_ROOT_PASSWORD} \
        --admin_email=${WORDPRESS_ROOT_EMAIL}

    wp user create --allow-root \
        ${WORDPRESS_USER} \
        ${WORDPRESS_EMAIL} \
        --user_pass=${WORDPRESS_PASSWORD} \
        --role=author

    wp plugin install --allow-root redis-cache --activate
    wp redis enable --allow-root
    
fi

/usr/sbin/php-fpm7.3 -F