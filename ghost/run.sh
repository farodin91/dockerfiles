#!/bin/bash

echo "START GHOST"
NGINX_DIR="/opt/nginx"
OVERRIDE="/ghost-override"
CONFIG_JS="config.js"
TMP_NGINX_DIR="/tmp/nginx"
TMP_CONFIG_JS="/tmp/config.js"

echo "SETUP ENV"

CONFIGURE_NGINX=${CONFIGURE_NGINX:-true}
USE_SSL=${USE_SSL:-false}
NAME_LINK_NGINX=${NAME_LINK_NGINX:-ghost}
NGINX_MAX_UPLOAD_SIZE=${NGINX_MAX_UPLOAD_SIZE:-20m}
PORT=${PORT:-80}

SERVER_NAME=${SERVER_NAME:-localhost}
GHOST_HOST=${GHOST_HOST:-127.0.0.1}
GHOST_PORT=${GHOST_PORT:-9000}
POSTGRES_HOST=${POSTGRES_HOST:-postgres}
POSTGRES_USER=${POSTGRES_USER:-ghost}
POSTGRES_PW=${POSTGRES_PW:-pw}
POSTGRES_DB=${POSTGRES_DB:-ghost}


if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
    if [ "$CONFIGURE_NGINX" = "true" ]; then
        echo "ADD NGINX"
        if [ "$USE_SSL" = "true"]; then
            cp $TMP_NGINX_DIR/ghost-ssl $NGINX_DIR/$NAME_LINK_NGINX
        else
            cp $TMP_NGINX_DIR/ghost $NGINX_DIR/$NAME_LINK_NGINX
        fi

        sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NAME_LINK_NGINX}}/'"${NAME_LINK_NGINX}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{GHOST_PORT}}/'"${GHOST_PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{PORT}}/'"${PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
fi
if [ ! -e $OVERRIDE/$CONFIG_JS ]; then
    echo "ADD CONFIG"
    cp $TMP_CONFIG_JS $OVERRIDE/$CONFIG_JS

    sed 's,{{SERVER_NAME}},'"${SERVER_NAME}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{GHOST_HOST}},'"${GHOST_HOST}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{GHOST_PORT}},'"${GHOST_PORT}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{POSTGRES_HOST}},'"${POSTGRES_HOST}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{POSTGRES_USER}},'"${POSTGRES_USER}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{POSTGRES_PW}},'"${POSTGRES_PW}"',' -i "$OVERRIDE/$CONFIG_JS"
    sed 's,{{POSTGRES_DB}},'"${POSTGRES_DB}"',' -i "$OVERRIDE/$CONFIG_JS"
fi

echo "RUN GHOST"
bash /ghost-start