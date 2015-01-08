FROM dockerfile/ubuntu

ENV NAME_LINK_NGINX php 

RUN apt-get update && \
	apt-get install -y php5-fpm
RUN mkdir /data && mkdir /data/nginx && mkdir /data/config && mkdir /var/share && mkdir /var/share/www

ADD index.php /var/share/www/index.php
ADD run.sh /php-run

WORKDIR /var/share/www

VOLUME ["/var/share/www","/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "sh", "/php-run" ]