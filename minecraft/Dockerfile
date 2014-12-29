FROM dockerfile/java:latest


MAINTAINER farodin91


RUN cd /data
RUN wget -O minecraft_server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar 

EXPOSE 25565

VOLUME ["/data"]

WORKDIR /data

CMD [ "java -jar minecraft_server.jar"]