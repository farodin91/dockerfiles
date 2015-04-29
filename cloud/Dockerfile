FROM debian:wheezy

MAINTAINER farodin91



# Install install function.
RUN \
    apt-get update && \
    apt-get install -y wget apt-transport-https rsyslog supervisor

ADD open-xchange.list /etc/apt/sources.list.d/open-xchange.list

RUN \
    wget http://software.open-xchange.com/oxbuildkey.pub && \
    apt-key add - < oxbuildkey.pub && \
    apt-get update

RUN \
    apt-get install -y open-xchange open-xchange-authentication-imap open-xchange-passwordchange-script


RUN \
    apt-get install -y open-xchange-grizzly open-xchange-admin open-xchange-appsuite \
  open-xchange-appsuite-backend open-xchange-appsuite-manifest
    

# OX text
RUN \
    apt-get install -y open-xchange-documents-backend open-xchange-documents-ui open-xchange-documents-ui-static

# CalDAV & CardDAV
# RUN \
#     apt-get install -y open-xchange-caldav open-xchange-carddav open-xchange-webdav-acl open-xchange-webdav-directory

# OX Drive
RUN \
    apt-get install -y open-xchange-drive open-xchange-drive-comet open-xchange-dav

RUN \
	cp -r /opt/open-xchange/etc/ /tmp/ && \
	rm -r /opt/open-xchange/etc/

VOLUME /opt/open-xchange/etc/
VOLUME /var/log/open-xchange/

ADD run.sh /data/run
ADD assets/open-xchange.sh /data/open-xchange.sh
ADD assets/supervisord.conf /etc/supervisor/supervisord.conf

CMD [ "bash", "/data/run" ]