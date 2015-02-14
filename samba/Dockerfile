FROM dockerfile/ubuntu


RUN apt-get update && \
	apt-get install -y libnss-ldap samba samba-doc smbldap-tools smbclient

VOLUME ["/var/log/samba","/data"]

EXPOSE 389
EXPOSE 636
EXPOSE 445

CMD [ "bash" ]