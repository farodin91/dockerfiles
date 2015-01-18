FROM farodin91/phpfpm


ENV VERSION 7.0.1

RUN apt-get update && \
	apt-get install -y php-bz2 php-intl php-openssl php-ldap smbclient php-ftp php-exif php-apc

RUN cd /tmp
RUN wget https://owncloud.org/owncloud.asc
RUN wget https://download.owncloud.org/community/owncloud-${VERSION}.tar.bz2
RUN gpg --import owncloud.asc
RUN gpg owncloud-${VERSION}.tar.bz2
RUN tar -xjf owncloud-${VERSION}.tar.bz2

ADD run.sh /owncloud-run
COPY nginx/ /tmp/nginx/
ADD autoconfig.php /tmp/autoconfig.php 

RUN cp -r /tmp/owncloud /var/www/
RUN chown 777  $DATA_DIR -R

WORKDIR /var/www

VOLUME ["/var/www","/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "bash", "/owncloud-run" ]