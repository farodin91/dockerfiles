#!/bin/bash

echo "START OWNCLOUD"

TMP_NGINX_DIR="/tmp/nginx"
CONFIG_DIR="/opt/config"
NGINX_CONF="/etc/nginx/nginx.conf"
EDIT_NGINX_CONF="/opt/nginx/nginx.conf"
AUTOCONFIG="/var/www/owncloud/config/autoconfig.php"
CONFIG="/var/www/owncloud/config/config.php"

echo "SETUP ENV"

DATA_DIR=${DATA_DIR:-/var/www}
USE_SSL=${USE_SSL:-false}
NGINX_MAX_UPLOAD_SIZE=${NGINX_MAX_UPLOAD_SIZE:-20m}
SERVER_NAME=${SERVER_NAME:-localhost}

echo "CONFIGURE NGINX"

if [ ! -e $EDIT_NGINX_CONF ]; then
    if [ "$USE_SSL" = "true"]; then
        cp $TMP_NGINX_DIR/owncloud-ssl $NGINX_CONF
    else
        cp $TMP_NGINX_DIR/owncloud $NGINX_CONF
    fi
    sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i $NGINX_CONF
    sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_CONF
    cp $NGINX_CONF $EDIT_NGINX_CONF
else
    cp $EDIT_NGINX_CONF $NGINX_CONF
fi


echo "WRITE CONFIG"

if [ ! -e $CONFIG ]; then
    cp /tmp/autoconfig.php $AUTOCONFIG
    sed 's/{{POSTGRES_DB}}/'"${POSTGRES_DB}"'/' -i $AUTOCONFIG
    sed 's/{{POSTGRES_USER}}/'"${POSTGRES_USER}"'/' -i $AUTOCONFIG
    sed 's/{{POSTGRES_PW}}/'"${POSTGRES_PW}"'/' -i $AUTOCONFIG
    sed 's/{{POSTGRES_HOST}}/'"${POSTGRES_HOST}"'/' -i $AUTOCONFIG
    sed 's/{{ROOT_NAME}}/'"${ROOT_NAME}"'/' -i $AUTOCONFIG
    sed 's/{{ROOT_PW}}/'"${ROOT_PW}"'/' -i $AUTOCONFIG
fi

chown -R www-data:www-data /var/www/owncloud/*

echo "SETUP LOG"

touch /var/log/nginx/access.log
touch /var/log/nginx/error.log
touch /var/log/cron/owncloud.log

tail -F /var/log/nginx/*.log /var/log/cron/owncloud.log &

chown -R www-data:www-data /var/www/owncloud/*
echo "RUN OWNCLOUD"

/usr/sbin/cron -f &
/etc/init.d/php5-fpm start
/etc/init.d/nginx start