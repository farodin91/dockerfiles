FROM dockerfile/ubuntu

RUN apt-get update && \
	apt-get install -y php5-fpm && \
	sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
RUN mkdir /data

ADD index.php /data/index.php

WORKDIR /data

EXPOSE 9000

CMD ["php5-fpm"]