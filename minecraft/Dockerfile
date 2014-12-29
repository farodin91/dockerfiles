FROM dockerfile/java:latest


MAINTAINER farodin91


RUN cd /data
RUN wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar 
RUN useradd minecraft
RUN chown minecraft:minecraft /data


ADD eula.txt /data/eula.txt

USER minecraft

EXPOSE 25565

VOLUME ["/data/world"]

WORKDIR /data

CMD [ "java","-jar minecraft_server.jar"]