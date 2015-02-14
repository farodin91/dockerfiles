FROM dockerfile/java:latest

MAINTAINER farodin91

ENV VERSION 1.7.10-10.13.2.1291

RUN cd /tmp
RUN wget -O installer.jar http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar
RUN java -jar installer.jar --installServer 
RUN rm installer.jar 
RUN mv forge-${VERSION}-universal.jar forge.jar

ADD run.sh /data/run

EXPOSE 25565

VOLUME ["/data/world","/data/mods","/data/config","/data"]

WORKDIR /data
ENV JVM_OPTS -Xmx2024M -Xms2024M

CMD [ "sh", "/data/run" ]
