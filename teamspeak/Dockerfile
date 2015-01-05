FROM dockerfile/ubuntu

ENV VERSION 3.0.11.2

RUN mkdir /var/lib/teamspeak
RUN wget -O /tmp/teamspeak-server.tar.gz http://dl.4players.de/ts/releases/$VERSION/teamspeak3-server_linux-amd64-$VERSION.tar.gz
RUN ls /tmp
RUN mkdir /tmp/ts
RUN tar -xvf /tmp/teamspeak-server.tar.gz -C /tmp/ts 
RUN cp -r /tmp/ts/teamspeak3-server_linux-amd64/. /var/lib/teamspeak
