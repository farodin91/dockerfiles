#!/bin/bash


echo "CONFIGURE OPEN-XCHANGE"
if [ls -l /opt/open-xchange/etc/ | grep -c ^- > 0] ; then
	cp -r /tmp/etc/ /opt/open-xchnage/etc 
fi



ehco "START OPEN-XCHANGE"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf