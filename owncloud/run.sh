#!/bin/bash

echo "START OWNCLOUD"

NGINX_DIR="/etc/nginx/sites-enabled/"
TMP_NGINX_DIR="/tmp/nginx"
CONFIG_DIR="/opt/config"

echo "SETUP ENV"

DATA_DIR=${DATA_DIR:-/var/www}
NAME_LINK_NGINX=${NAME_LINK_NGINX:-owncloud}
FASTCGI_PORT=${FASTCGI_PORT:-9000}
PORT=${PORT:-80}
CONFIGURE_NGINX=${CONFIGURE_NGINX:-true}
USE_SSL=${USE_SSL:-false}
NGINX_MAX_UPLOAD_SIZE=${NGINX_MAX_UPLOAD_SIZE:-20m}
INDEX_PHP=${INDEX_PHP:-index.php}
SERVER_NAME=${SERVER_NAME:-localhost}

if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
    if [ "$CONFIGURE_NGINX" = "true" ]; then
        echo "ADD NGINX"

        if [ "$USE_SSL" = "true"]; then
            cp $TMP_NGINX_DIR/owncloud-ssl $NGINX_DIR/$NAME_LINK_NGINX
        else
            cp $TMP_NGINX_DIR/owncloud $NGINX_DIR/$NAME_LINK_NGINX
        fi
        sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NAME_LINK_NGINX}}/'"${NAME_LINK_NGINX}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{FASTCGI_PORT}}/'"${FASTCGI_PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{PORT}}/'"${PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{INDEX_PHP}}/'"${INDEX_PHP}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{ROOT}}/'"${DATA_DIR}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
    fi
fi

chown 777  www-data:www-data -R

echo "WRITE CONFIG"

tail -F /var/log/nginx/*.log /var/log/cron/owncloud.log &

echo "RUN OWNCLOUD"

/usr/sbin/cron -f &
/etc/init.d/php5-fpm start
/etc/init.d/nginx start