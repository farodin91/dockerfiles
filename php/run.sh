#!/bin/bash

NGINX_DIR=/opt/nginx
#NAME_LINK_NGINX=${NAME_LINK_NGINX:ghost}
GHOST_PORT=2368

if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
	touch $NGINX_DIR/$NAME_LINK_NGINX
	echo "upstream $NAME_LINK_NGINX{" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "	 server $NAME_LINK_NGINX:$GHOST_PORT;" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "}\n" >> $NGINX_DIR/$NAME_LINK_NGINX

    echo "server { ">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   listen 80 default_server;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   listen [::]:80 default_server;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   location / {">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      proxy_pass http://ghost;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   }">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "} ">> $NGINX_DIR/$NAME_LINK_NGINX
fi


php5-fpm