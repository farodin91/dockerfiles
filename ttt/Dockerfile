FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update &&\
    apt-get install -y curl lib32gcc1 lib32stdc++6

# Download and extract SteamCMD
RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

#RUN bash /opt/steamcmd/steamcmd.sh \+login anonymous \+force_install_dir /opt/ttt \+app_update 4020 \+quit

WORKDIR /opt/steamcmdCMD 
#CMD [ "/opt/ttt/srcds_run", "-console -maxplayers 16 -game garrysmod +gamemode terrortown +map gm_construct" ]

# This container will be executable
#ENTRYPOINT ["./steamcmd.sh"]