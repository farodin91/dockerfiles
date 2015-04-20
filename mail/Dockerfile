FROM debian:wheezy

MAINTAINER farodin91

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Install install function.
RUN \
    mkdir /data && \
    mkdir /data/config && \
    mkdir /tmp/postfix && \
    mkdir /tmp/dovecot && \
    mkdir /var/log/dovecot && \
    mkdir /var/log/postfix && \
    apt-get update  && \
    apt-get install -y rsyslog supervisor

# Install Dovecot.
RUN \
    apt-get install -y dovecot-ldap dovecot-imapd dovecot-lmtpd && \
    rm -r /etc/dovecot/*

# Install Postfix.
RUN \
    apt-get install -y postfix postfix-ldap && \
    rm -r /etc/postfix/*

# Install Spamassassin
# RUN \
#     apt-get install -y spamassassin

# Install ClamAV
# RUN \
#     apt-get install -y clamav clamav-base 

# Tests
RUN apt-get install -y htop wget telnet nano

ADD run.sh /data/run
ADD postfix.sh /data/postfix.sh
ADD dovecot.sh /data/dovecot.sh
ADD supervisord.conf /etc/supervisor/supervisord.conf
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