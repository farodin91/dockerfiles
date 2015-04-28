#!/bin/bash


echo "CONFIGURE OPEN-XCHANGE"
if[ ! /opt/open-xchange/etc/configdb.properties] ; then
	cp -r /tmp/etc/ /opt/open-xchange/etc 
fi

echo "CONFIGURE SUPERVISOR"
chmod +x /data/open-xchange.sh



echo "START OPEN-XCHANGE"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf