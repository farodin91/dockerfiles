#!/bin/bash

NGINX_DIR=/opt/nginx
#NAME_LINK_NGINX=${NAME_LINK_NGINX:ghost}
PORT=9000
 
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
    echo "      fastcgi_param QUERY_STRING $query_string;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param REQUEST_METHOD $request_method;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param CONTENT_TYPE $content_type;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param CONTENT_LENGTH $content_length;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SCRIPT_NAME $fastcgi_script_name;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param REQUEST_URI $request_uri;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param DOCUMENT_URI $document_uri;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param DOCUMENT_ROOT $document_root;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SERVER_PROTOCOL $server_protocol;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param GATEWAY_INTERFACE CGI/1.1;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SERVER_SOFTWARE nginx/$nginx_version;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param REMOTE_ADDR $remote_addr;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param REMOTE_PORT $remote_port;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SERVER_ADDR $server_addr;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SERVER_PORT $server_port;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SERVER_NAME $server_name;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param REDIRECT_STATUS 200;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "   }">> $NGINX_DIR/$NAME_LINK_NGINX
    echo "} ">> $NGINX_DIR/$NAME_LINK_NGINX
fi


sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
sed 's/;listen = //var//run//php5-fpm.sock/listen = 9000/' -i /etc/php5/fpm/pool.d/www.conf

echo "RUN php-fpm"
php5-fpm -F