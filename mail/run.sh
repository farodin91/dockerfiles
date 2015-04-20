
DOVECOT_MAIN_CONF="/etc/dovecot/dovecot.conf"
DOVECOT_TMP_MAIN_CONF="/tmp/dovecot/dovecot.conf"
DOVECOT_LDAP_CONF="/etc/dovecot/dovecot-ldap.conf"
DOVECOT_TMP_LDAP_CONF="/tmp/dovecot/dovecot-ldap.conf"
POSTFIX_MAIN_CONF="/etc/postfix/main.cf"
POSTFIX_MAIN_DIR="/etc/postfix"
POSTFIX_TMP_DIR="/tmp/postfix/*"

echo "CONFIGURE DOVECOT"
if [ ! -e $DOVECOT_MAIN_CONF ]; then
	cp $DOVECOT_TMP_MAIN_CONF $DOVECOT_MAIN_CONF
fi

if [ ! -e $DOVECOT_LDAP_CONF ]; then
	cp $DOVECOT_TMP_LDAP_CONF $DOVECOT_LDAP_CONF
fi

echo "CONFIGURE POSTFIX"
if [ ! -e $POSTFIX_MAIN_CONF ]; then
	cp -r $POSTFIX_TMP_DIR $POSTFIX_MAIN_DIR
fi


/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

#echo "START POSTFIX"
#postfix start

#echo "START DOVECOT"
#rm /var/log/dovecot/info.log
#dovecot

#echo "START SYSLOG"
#rsyslogd -n -c3

#tail -f /var/log/mail.log