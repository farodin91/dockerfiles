
NGINX_DIR=/opt/nginx
#GHOST_NAME_LINK_NGINX=${GHOST_NAME_LINK_NGINX:ghost}
GHOST_PORT=2368

if [ ! -e $NGINX_DIR/$GHOST_NAME_LINK_NGINX ]; then
	touch $NGINX_DIR/$GHOST_NAME_LINK_NGINX
	echo "upstream $GHOST_NAME_LINK_NGINX{\n" >> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "	 server $GHOST_NAME_LINK_NGINX:$GHOST_PORT;\n" >> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "}\n\n" >> $NGINX_DIR/$GHOST_NAME_LINK_NGINX

    echo "server {\n ">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "   listen 80 default_server;">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "   listen [::]:80 default_server;">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "   location / {">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "      proxy_pass http://ghost;">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "   }">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
    echo "}\n ">> $NGINX_DIR/$GHOST_NAME_LINK_NGINX
fi


bash /ghost-start