
SLAPD_CONF="/etc/ldap/slapd.conf"
EDIT_ODBC_CONF="/data/config/odbc.ini"
TMP_SLAPD_CONF="/tmp/slapd.conf"
EDIT_ODBC_CONF="/data/config/odbc.ini"
ODBC_CONF="/etc/odbc.ini"
TMP_ODBC_CONF="/tmp/odbc.ini"


echo "CONFIGURE SLAPD"

if [ ! -e $SLAPD_CONF ]; then
    sed 's/{{DB_USERNAME}}/'"${POSTGRES_USER}"'/' -i $SLAPD_CONF
    sed 's/{{DB_PASSWORD}}/'"${POSTGRES_PASSWORD}"'/' -i $SLAPD_CONF

    cp $TMP_SLAPD_CONF $SLAPD_CONF
fi

echo "CONFIGURE ODBC"

if [ ! -e $EDIT_ODBC_CONF ]; then
	cp $TMP_ODBC_CONF $ODBC_CONF

    sed 's/{{HOST}}/'"${POSTGRES_HOST}"'/' -i $ODBC_CONF
    sed 's/{{DB_USERNAME}}/'"${POSTGRES_USER}"'/' -i $ODBC_CONF
    sed 's/{{DB_NAME}}/'"${POSTGRES_DB}"'/' -i $ODBC_CONF
    sed 's/{{DB_PASSWORD}}/'"${POSTGRES_PASSWORD}"'/' -i $ODBC_CONF

    cp $ODBC_CONF $EDIT_ODBC_CONF
else
    cp $EDIT_ODBC_CONF $ODBC_CONF
fi





/usr/sbin/slapd -d 0 -F /data/config