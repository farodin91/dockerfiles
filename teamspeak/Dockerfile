FROM dockerfile/ubuntu

ENV VERSION 3.0.11.2

RUN mkdir /data \
	cd /data
RUN mkdir /var/lib/teamspeak \
	cd /var/lib/teamspeak \
	wget -O /tmp/teamspeak-server.tar.gz http://dl.4players.de/ts/releases/$VERSION/teamspeak3-server_linux-amd64-$VERSION.tar.gz \
	tar -xf /tmp/teamspeak-server.tar.gz -C /tmp/ts \
	cp -r /tmp/ts/teamspeak3-server_linux-amd64/. /var/lib/teamspeak
