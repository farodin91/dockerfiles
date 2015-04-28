FROM debian:wheezy

MAINTAINER farodin91



# Install install function.
RUN \
    apt-get update && \
    apt-get install -y wget apt-transport-https

ADD open-xchange.list /etc/apt/sources.list.d/open-xchange.list

RUN \
    wget http://software.open-xchange.com/oxbuildkey.pub && \
    apt-key add - < oxbuildkey.pub && \
    apt-get update

RUN \
    apt-get install -y open-xchange open-xchange-authentication-imap


RUN \
    apt-get install -y open-xchange-grizzly open-xchange-admin open-xchange-appsuite \
  open-xchange-appsuite-backend open-xchange-appsuite-manifest
    

# Document Viewer
RUN \
    apt-get install -y readerengine open-xchange-documentconverter open-xchange-documents-ui-viewer open-xchange-documents-ui-static \
    open-xchange-documents-backend open-xchange-documents-ui

# CalDAV & CardDAV
# RUN \
#     apt-get install -y open-xchange-caldav open-xchange-carddav open-xchange-webdav-acl open-xchange-webdav-directory

# OX Drive
RUN \
    apt-get install -y open-xchange-drive open-xchange-drive-comet open-xchange-drive-restricted open-xchange-updater-drive

ADD run.sh /data/run

CMD [ "bash", "/data/run" ]