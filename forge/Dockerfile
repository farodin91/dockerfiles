FROM dockerfile/java:latest

MAINTAINER farodin91

ENV VERSION 1.7.10-10.13.2.1291

RUN cd /root && \
	wget -O installer.jar http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar  && \
	java -jar installer.jar --installServer  && \
	rm installer.jar  && \
	mv forge-${VERSION}-universal.jar forge.jar

ADD run.sh /run.sh

EXPOSE 25565

VOLUME ["/data/world","/data/mods","/data/config","/data"]

WORKDIR /data
ENV JVM_OPTS -Xmx2024M -Xms2024M

CMD [ "sh", "/run.sh" ]
