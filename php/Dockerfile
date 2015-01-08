FROM dockerfile/ubuntu

ENV NAME_LINK_NGINX php 

RUN apt-get update && \
	apt-get install -y php5-fpm
RUN mkdir /data && mkdir /data/nginx && mkdir /data/config

ADD index.php /data/index.php
ADD run.sh /php-runc d

WORKDIR /data

VOLUME ["/data","/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "sh", "/php-run" ]