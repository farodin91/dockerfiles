FROM dockerfile/ghost


ENV GHOST_NAME_LINK_NGINX ghost 


VOLUME ["/data", "/ghost-override","/opt/nginx"]

ADD run.sh /ghost-run

WORKDIR /ghost

CMD [ "sh", "/ghost-run" ]

EXPOSE 2368