#!/bin/bash

NGINX_DIR=/opt/nginx
TMP_NGINX_DIR=/tmp/nginx
CONFIG_DIR=/opt/config
DATA_DIR=${DATA_DIR:-/var/www}
NAME_LINK_NGINX=${NAME_LINK_NGINX:-phpfpm}
FASTCGI_PORT=${FASTCGI_PORT:-9000}
PORT=${PORT:-80}
CONFIGURE_NGINX=${CONFIGURE_NGINX:-true}
USE_SSL=${USE_SSL:-false}
NGINX_MAX_UPLOAD_SIZE=${NGINX_MAX_UPLOAD_SIZE:-20m}
INDEX_PHP=${INDEX_PHP:-index.php}
SERVER_NAME=${SERVER_NAME:-localhost}

echo  $NGINX_DIR/$NAME_LINK_NGINX 

if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
    if [ "$CONFIGURE_NGINX" = "true" ]; then
        if [ "$USE_SSL" = "true"]; then
            cp $TMP_NGINX_DIR/phpfpm-ssl $NGINX_DIR/$NAME_LINK_NGINX
        else
            cp $TMP_NGINX_DIR/phpfpm $NGINX_DIR/$NAME_LINK_NGINX
        fi
        sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NAME_LINK_NGINX}}/'"${NAME_LINK_NGINX}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{FASTCGI_PORT}}/'"${FASTCGI_PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{PORT}}/'"${PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{INDEX_PHP}}/'"${INDEX_PHP}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
    fi
fi

chown 777  $DATA_DIR -R

sed 's/;daemonize = yes/daemonize = no/g' -i /etc/php5/fpm/php-fpm.conf \
&& sed 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' -i /etc/php5/fpm/php.ini \
&& sed 's/listen = \/var\/run\/php5-fpm.sock/listen = $FASTCGI_PORT/g' -i /etc/php5/fpm/pool.d/www.conf \
&& sed 's,;chroot =,chroot = $DATA_DIR,g' -i /etc/php5/fpm/pool.d/www.conf

if [ -e $CONFIG_DIR/php.ini ]; then
    cp $CONFIG_DIR/php.ini /etc/php5/fpm/php.ini
else
    cp /etc/php5/fpm/php.ini $CONFIG_DIR/php.ini
fi

if [ -e $CONFIG_DIR/php-fpm.conf ]; then
    cp $CONFIG_DIR/php-fpm.conf /etc/php5/fpm/php-fpm.conf
else
    cp /etc/php5/fpm/php-fpm.conf $CONFIG_DIR/php-fpm.conf
fi

if [ -e $CONFIG_DIR/www.conf ]; then
    cp $CONFIG_DIR/www.conf /etc/php5/fpm/pool.d/www.conf
else
    cp /etc/php5/fpm/pool.d/www.conf $CONFIG_DIR/www.conf
fi

echo "RUN php-fpm"
php5-fpm -F