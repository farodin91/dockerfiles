FROM debian:wheezy

MAINTAINER farodin91

# Install install function.
RUN \
	mkdir /data && \
	apt-get update	
#	apt-get install -y wget

# Install OpenLDAP.
RUN \
	apt-get install -y slapd && \
	rm -R /etc/ldap/slapd.d/ && \
	mkdir /etc/ldap/slapd.d/

# Install unixODBC.
RUN \
	apt-get install -y unixodbc

# Install psqlODBC.
RUN \
	apt-get install -y odbc-postgresql


ADD run.sh /data/run
ADD odbc.ini /tmp/odbc.ini
ADD odbcinst.ini /tmp/odbcinst.ini
ADD slapd.conf /tmp/slapd.conf

VOLUME ["/data/config"]

EXPOSE 389 636

CMD [ "bash", "/data/run" ]
