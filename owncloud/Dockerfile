FROM farodin91/phpfpm


ENV VERSION 7.0.1

RUN apt-get update && \
	apt-get install -y php5-gmp php5-bz2 php5-intl php5-openssl php5-ldap smbclient php5-ftp php5-exif php5-apcu php5-imagick

RUN cd /tmp && rmdir -f /tmp/nginx  && \
	wget https://owncloud.org/owncloud.asc && \
	wget https://download.owncloud.org/community/owncloud-${VERSION}.tar.bz2 && \
	gpg --import owncloud.asc && \
	gpg owncloud-${VERSION}.tar.bz2 && \
	tar -xjf owncloud-${VERSION}.tar.bz2 && \
	cp -r /tmp/owncloud /var/www/&& \
	chown 777  $DATA_DIR -R 

ADD run.sh /owncloud-run
COPY nginx/ /tmp/nginx/
ADD autoconfig.php /tmp/autoconfig.php 

WORKDIR /var/www

VOLUME ["/var/www","/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "bash", "/owncloud-run" ]