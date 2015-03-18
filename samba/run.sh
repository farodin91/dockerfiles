
WORKGROUP=${WORKGROUP:-test}
SERVER_STRING=${SERVER_STRING:-test}
NETBIOS_NAME=${NETBIOS_NAME:-test}

LDAP_SUFFIX=${LDAP_SUFFIX:-test}
LDAP_URL=${LDAP_URL:-ldap:\/\/localhost}
LDAP_SSL=${LDAP_SSL:-off}
LDAP_ADMIN_DN=${LDAP_ADMIN_DN:-cn=admin,dc=test}
LDAP_GROUP_SUFFIX=${LDAP_GROUP_SUFFIX:-groups}
LDAP_MACHINE_SUFFIX=${LDAP_MACHINE_SUFFIX:-computer}
LDAP_USER_SUFFIX=${LDAP_USER_SUFFIX:-users}


INIT_CONF="/opt/init.pp"

sed 's/{{WORKGROUP}}/'"${WORKGROUP}"'/' -i $INIT_CONF
sed 's/{{SERVER_STRING}}/'"${SERVER_STRING}"'/' -i $INIT_CONF
sed 's/{{NETBIOS_NAME}}/'"${NETBIOS_NAME}"'/' -i $INIT_CONF
sed 's/{{LDAP_SUFFIX}}/'"${LDAP_SUFFIX}"'/' -i $INIT_CONF
sed 's,{{LDAP_URL}},'"${LDAP_URL}"'/' -i $INIT_CONF
sed 's/{{LDAP_SSL}}/'"${LDAP_SSL}"'/' -i $INIT_CONF
sed 's/{{LDAP_ADMIN_DN}}/'"${LDAP_ADMIN_DN}"'/' -i $INIT_CONF
sed 's/{{LDAP_GROUP_SUFFIX}}/'"${LDAP_GROUP_SUFFIX}"'/' -i $INIT_CONF
sed 's/{{LDAP_MACHINE_SUFFIX}}/'"${LDAP_MACHINE_SUFFIX}"'/' -i $INIT_CONF
sed 's/{{LDAP_USER_SUFFIX}}/'"${LDAP_USER_SUFFIX}"'/' -i $INIT_CONF

puppet apply -vd init.pp

/etc/init.d/samba start

tail -f /var/log/dmesg