FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update &&\
    apt-get install -y curl lib32gcc1 lib32stdc++6

# Download and extract SteamCMD
RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

RUN mkdir -p /root/.steam/sdk32
RUN ln -s /opt/steamcmd/linux32/steamclient.so /root/.steam/sdk32/steamclient.so

ADD run.sh /run.sh


VOLUME ["/opt/ttt"]

CMD [ "sh", "/run.sh" ]