FROM dockerfile/ubuntu

ENV NAME_LINK_NGINX php 

RUN apt-get update && \
	apt-get install -y php5-fpm
RUN mkdir /data

ADD index.php /data/index.php
ADD run.sh /php-run
ADD www.conf /etc/php5/fpm/pool.d/www.conf

WORKDIR /data

VOLUME ["/data","/opt/nginx"]

EXPOSE 9000

CMD [ "sh", "/php-run" ]