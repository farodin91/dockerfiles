FROM debian:wheezy

MAINTAINER farodin91

# Install install function.
RUN \
    mkdir /data && \
    mkdir /data/config && \
    mkdir /tmp/postfix && \
    mkdir /tmp/dovecot && \
    mkdir /var/log/dovecot && \
    mkdir /var/vmail && \
    apt-get update  

# Install Postfix.
#RUN \
#    apt-get install -y postfix postfix-tls postfix-ldap postfix-pgsql sasl2-bin libsasl2-modules libpam-pgsql

# Install Dovecot.
RUN \
    apt-get install -y dovecot-ldap dovecot-imapd dovecot-lmtpd && \
    rm -r \etc\dovecot\*

ADD run.sh /data/run
ADD dovecot/dovecot.conf /tmp/dovecot/dovecot.conf
ADD dovecot/dovecot-ldap.conf /tmp/dovecot/dovecot-ldap.conf

VOLUME ["/data/config","/etc/dovecot","/etc/ssl/certs","/etc/ssl/private","/etc/postfix","/var/vmail","/var/log/dovecot"]

EXPOSE 25 143 993

CMD [ "bash", "/data/run" ]