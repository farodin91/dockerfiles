FROM debian:wheezy

MAINTAINER farodin91

# Install install function.
RUN \
    mkdir /data && \
    mkdir /data/config && \
    mkdir /data/config/postfix && \
    mkdir /data/config/dovecot && \
    mkdir /tmp/postfix && \
    mkdir /tmp/dovecot && \
    apt-get update  

# Install Postfix.
RUN \
    apt-get install -y postfix postfix-tls postfix-ldap postfix-pgsql sasl2-bin libsasl2-modules libpam-pgsql

# Install Dovecot.
RUN \
    apt-get install -y dovecot dovecot-ldap dovecot-imapd dovecot-lmtpd dovecot-pgsql && \
    rm -r /etc/dovecot/*

ADD run.sh /data/run
ADD dovecot/dovecot.conf /tmp/dovecot/dovecot.conf
ADD dovecot/dovecot-ldap.conf /tmp/dovecot/dovecot-ldap.conf

VOLUME ["/data/config","/etc/dovecot","/etc/ssl","/etc/postfix","/var/vmail"]

EXPOSE 25, 143, 993

CMD [ "bash", "/data/run" ]