FROM dockerfile/ubuntu

ENV NAME_LINK_NGINX owncloud 
ENV DATA_DIR /var/www
ENV VERSION 7.0.2

RUN apt-get update && \
	apt-get install -y php5-fpm php5-curl php5-gd php5-mcrypt \ 
	php5-mysql php5-pgsql php5-sqlite sharutils libmcrypt4 \
	ffmpegthumbnailer smbclient php-xml-parser php5-intl \
	php5-curl liboauth-php libphp-pclzip libphp-phpmailer php-file \
	php-aws-sdk php-crypt-blowfish php-doctrine-common php-dompdf php-dropbox \
	php-font-lib php-getid3 php-guzzle php-irods-prods \
	php-opencloud php-patchwork-utf8 php-pear php-phpdocx php-sabre-dav \
	php-sabre-vobject php-seclib php-services-json php-symfony-console \
	php-symfony-eventdispatcher php-symfony-routing php-fpdf php5-apcu \
	php5-common php5-imagick php-net-ftp php5-gmp php5-json php5-ldap \
	php5-oauth php5-readline php5-tidy php5-xsl sdop zend-framework \
	zend-framework-bin libzend-framework-php &&\
	apt-get clean && \
	mkdir /data && mkdir /data/nginx && mkdir /data/config && mkdir /var/www

RUN cd /tmp && \
	wget https://download.owncloud.org/community/owncloud-${VERSION}.tar.bz2 && \
	tar -xjf owncloud-${VERSION}.tar.bz2

RUN cp -f -r /tmp/owncloud/* /var/www  

ADD run.sh /owncloud-run
COPY nginx/ /tmp/nginx/
ADD autoconfig.php /tmp/autoconfig.php 
ADD test.php /var/www/test.php

WORKDIR /var/www

VOLUME ["/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "bash", "/owncloud-run" ]