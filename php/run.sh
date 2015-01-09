#!/bin/bash

NGINX_DIR=/opt/nginx
CONFIG_DIR=/opt/config
DATA_DIR=/var/www
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
    echo "   root /;" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   location ~ \.php$ {">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      root /;" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_split_path_info ^(.+\.php)(/.+)$;" >> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_index index.php;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_pass $NAME_LINK_NGINX;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      include fastcgi_params;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param PATH_INFO \$fastcgi_script_name;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   }">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "} ">> $NGINX_DIR/$NAME_LINK_NGINX
fi

chown 777  $DATA_DIR -R

sed 's/;daemonize = yes/daemonize = no/g' -i /etc/php5/fpm/php-fpm.conf && sed 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' -i /etc/php5/fpm/php.ini  && sed 's/listen = \/var\/run\/php5-fpm.sock/listen = 9000/g' -i /etc/php5/fpm/pool.d/www.conf && sed 's/;chroot =/chroot = \/var\/www\//g' -i /etc/php5/fpm/pool.d/www.conf

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