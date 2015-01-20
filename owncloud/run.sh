#!/bin/bash

echo "START OWNCLOUD"

TMP_NGINX_DIR="/tmp/nginx"
CONFIG_DIR="/opt/config"
NGINX_CONF="/etc/nginx/nginx.conf"


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

if [ ! -e $NGINX_CONF ]; then
    if [ "$CONFIGURE_NGINX" = "true" ]; then
        echo "ADD NGINX"

        if [ "$USE_SSL" = "true"]; then
            cp $TMP_NGINX_DIR/owncloud-ssl $NGINX_CONF
        else
            cp $TMP_NGINX_DIR/owncloud $NGINX_CONF
        fi
        sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i $NGINX_CONF
        sed 's/{{NAME_LINK_NGINX}}/'"${NAME_LINK_NGINX}"'/' -i $NGINX_CONF
        sed 's/{{FASTCGI_PORT}}/'"${FASTCGI_PORT}"'/' -i $NGINX_CONF
        sed 's/{{PORT}}/'"${PORT}"'/' -i $NGINX_CONF
        sed 's/{{INDEX_PHP}}/'"${INDEX_PHP}"'/' -i $NGINX_CONF
        sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_CONF
        sed 's/{{ROOT}}/'"${DATA_DIR}"'/' -i $NGINX_CONF
    fi
fi

chown -R www-data:www-data /var/www/owncloud/*

echo "WRITE CONFIG"

echo "SETUP LOG"

touch /var/log/nginx/access.log
touch /var/log/nginx/error.log
touch /var/log/cron/owncloud.log

tail -F /var/log/nginx/*.log /var/log/cron/owncloud.log &

echo "RUN OWNCLOUD"

/usr/sbin/cron -f &
/etc/init.d/nginx start
php5-fpm -F