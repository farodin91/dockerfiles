
DOVECOT_MAIN_CONF="/etc/dovecot/dovecot.conf"
TMP_DOVECOT_MAIN_CONF="/tmp/dovecot/dovecot.conf"
DOVECOT_LDAP_CONF="/etc/dovecot/dovecot-ldap.conf"
TMP_DOVECOT_LDAP_CONF="/tmp/dovecot/dovecot-ldap.conf"


if [ ! -e $DOVECOT_MAIN_CONF ]; then
	cp $TMP_DOVECOT_MAIN_CONF $DOVECOT_MAIN_CONF
fi

if [ ! -e $DOVECOT_LDAP_CONF ]; then
	cp $TMP_DOVECOT_LDAP_CONF $DOVECOT_LDAP_CONF
fi


dovecot

tail -f /var/log/dovecot/info.log