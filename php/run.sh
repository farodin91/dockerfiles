#!/bin/bash

NGINX_DIR=/opt/nginx
PORT=9000

echo  $NGINX_DIR/$NAME_LINK_NGINX 

if [ ! -e $NGINX_DIR/$NAME_LINK_NGINX ]; then
echo "Create NGINX file"
	touch $NGINX_DIR/$NAME_LINK_NGINX
	echo "upstream $NAME_LINK_NGINX{" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "	 server $NAME_LINK_NGINX:$PORT;" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "}\n" >> $NGINX_DIR/$NAME_LINK_NGINX

    echo "server { ">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   listen 80;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   location ~ \.php$ {">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_index index.php;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_pass @$NAME_LINK_NGINX;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      include fastcgi_params;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   }">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "} ">> $NGINX_DIR/$NAME_LINK_NGINX
fi

sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
sed 's/;listen = \/var\/run\/php5-fpm.sock/listen = 9000/' -i /etc/php5/fpm/pool.d/www.conf

echo "RUN php-fpm"
php5-fpm -F