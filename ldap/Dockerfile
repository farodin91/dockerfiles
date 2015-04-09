FROM debian:wheezy

MAINTAINER farodin91

# Install install function.
RUN \
	mkdir /data && \
	apt-get update && \
#	apt-get install -y wget

# Install OpenLDAP.
RUN \
	apt-get install -y slapd

# Install unixODBC.
RUN \
	apt-get install -y unixodbc

# Install psqlODBC.
RUN \
	apt-get install -y odbc-postgresql


ADD run.sh /data/run
ADD odbc.ini /tmp/odbc.ini
ADD odbcinst.ini /tmp/odbcinst.ini

VOLUME ["/data/config"]

EXPOSE 389 636

CMD [ "bash", "/data/run" ]
