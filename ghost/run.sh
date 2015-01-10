#!/bin/bash

NGINX_DIR=/opt/nginx
NAME_LINK_NGINX=${NAME_LINK_NGINX:-ghost}
GHOST_PORT=${GHOST_PORT:-9000}
PORT=${PORT:-80}
CONFIGURE_NGINX=${CONFIGURE_NGINX:-true}
USE_SSL=${USE_SSL:-false}
NGINX_MAX_UPLOAD_SIZE=${NGINX_MAX_UPLOAD_SIZE:-20m}

if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
    if [ $CONFIGURE_NGINX == "true" ]; then
        if [ $USE_SSL == "true"]; then
            cp $TMP_NGINX_DIR/ghost-ssl $NGINX_DIR/$NAME_LINK_NGINX
        else
            cp $TMP_NGINX_DIR/ghost $NGINX_DIR/$NAME_LINK_NGINX
        fi
        sed 's/{{NAME_LINK_NGINX}}/'"${NAME_LINK_NGINX}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{GHOST_PORT}}/'"${GHOST_PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{PORT}}/'"${PORT}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
        sed 's/{{NGINX_MAX_UPLOAD_SIZE}}/'"${NGINX_MAX_UPLOAD_SIZE}"'/' -i $NGINX_DIR/$NAME_LINK_NGINX
fi


bash /ghost-start