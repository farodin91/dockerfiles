FROM dockerfile/java:latest

MAINTAINER farodin91

ENV VERSION 1.7.10-10.13.2.1230

RUN cd /data
RUN wget -O installer.jar http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar /
	java -jar installer.jar --installServer /
	rm installer.jar /
	mv forge-${VERSION}-universal.jar forge.jar

ADD run.sh /data/run

EXPOSE 25565

VOLUME ["/data/world","/data/mods","/data/config"]

WORKDIR /data
ENV JVM_OPTS -Xmx1024M -Xms1024M

CMD [ "sh", "/data/run" ]
