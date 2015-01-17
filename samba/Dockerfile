FROM dockerfile/ubuntu


RUN apt-get update && \
	apt-get install -y samba smbfs

VOLUME ["/var/log/samba","/data"]

EXPOSE 389
EXPOSE 636
EXPOSE 445

CMD [ "bash" ]