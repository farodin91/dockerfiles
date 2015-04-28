#!/bin/bash


echo "CONFIGURE OPEN-XCHANGE"
if[ ls -l /opt/open-xchange/etc/ | grep -c ^- > 0] ; then
	cp -r /tmp/etc/ /opt/open-xchange/etc 
fi

echo "CONFIGURE SUPERVISOR"
chmod +x /data/open-xchange.sh



echo "START OPEN-XCHANGE"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf