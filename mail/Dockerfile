FROM debian:wheezy

MAINTAINER farodin91

# Install install function.
RUN \
    mkdir /data && \
    mkdir /data/config && \
    mkdir /tmp/postfix && \
    mkdir /tmp/dovecot && \
    mkdir /var/log/dovecot && \
    mkdir /var/log/postfix && \
    apt-get update  

# Install Dovecot.
RUN \
    apt-get install -y dovecot-ldap dovecot-imapd dovecot-lmtpd && \
    rm -r /etc/dovecot/*

# Install Postfix.
RUN \
    apt-get install -y postfix postfix-ldap

# Install Spamassassin
# RUN \
#     apt-get install -y spamassassin

# Install ClamAV
# RUN \
#     apt-get install -y clamav clamav-base 

# Tests
RUN apt-get install -y htop wget telnet nano

ADD run.sh /data/run
ADD dovecot* /tmp/dovecot/
ADD postfix* /tmp/postfix/

VOLUME /data/config
VOLUME /etc/dovecot
VOLUME /etc/ssl/certs
VOLUME /etc/ssl/private
VOLUME /etc/postfix
VOLUME /var/mail
VOLUME /var/log/dovecot
VOLUME /var/log/postfix

EXPOSE 25 143 993 465

CMD [ "bash", "/data/run" ]