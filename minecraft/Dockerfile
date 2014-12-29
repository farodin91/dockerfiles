FROM dockerfile/java:latest

MAINTAINER farodin91

ENV VERSION 1.8.1
ENV EULA false

RUN cd /data
RUN wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar 
RUN echo "eula=${EULA}" > /data/eula.txt
RUN useradd minecraft
RUN chown -R minecraft:minecraft /data


USER minecraft

EXPOSE 25565

VOLUME ["/data/world"]

WORKDIR /data
ENV MEMORY 1024

CMD [ "java","-jar","minecraft_server.jar"]