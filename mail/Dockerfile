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
    apt-get install -y postfix postfix-ldap sasl2-bin lslibsasl2-modules
# postfix-pgsql sasl2-bin libsasl2-modules libpam-pgsql

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

VOLUME ["/data/config",
        "/etc/dovecot",
        "/etc/ssl/certs",
        "/etc/ssl/private",
        "/etc/postfix",
        "/var/mail",
        "/var/log/dovecot",
        "/var/log/postfix"]

EXPOSE 25 143 993 465

CMD [ "bash", "/data/run" ]