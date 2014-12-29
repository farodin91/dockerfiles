FROM dockerfile/java:latest

MAINTAINER farodin91

ENV VERSION 1.8.1
ENV EULA false


RUN cd /data \
	mkdir world \
	cd /data
RUN wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar 
RUN useradd minecraft \
	&& chown -R minecraft:minecraft /data


ADD run.sh /data/run

USER minecraft

EXPOSE 25565

VOLUME ["/data/world"]

WORKDIR /data
ENV JVM_OPTS -Xmx1024M -Xms1024M

CMD [ "sh", "/data/run" ]