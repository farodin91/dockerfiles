FROM dockerfile/ghost



ENV NAME_LINK_NGINX ghost 

VOLUME ["/data", "/ghost-override","/opt/nginx"]

ADD run.sh /ghost-run
ADD config.js /tmp/config.js
COPY nginx/ /tmp/nginx/

WORKDIR /ghost

CMD [ "bash", "/ghost-run" ]

EXPOSE 2368