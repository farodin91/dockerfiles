FROM dockerfile/ghost


ENV NAME_LINK_NGINX ghost 


VOLUME ["/data", "/ghost-override","/opt/nginx"]

ADD run.sh /ghost-run
COPY nginx/ /tmp/nginx/
ADD config.js /tmp/config.js

WORKDIR /ghost

CMD [ "bash", "/ghost-run" ]

EXPOSE 2368