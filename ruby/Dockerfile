FROM dockerfile/ubuntu

ENV NAME_LINK_NGINX ruby 

ADD run.sh /ruby-run
COPY nginx/ /tmp/nginx/

WORKDIR /var/www

VOLUME ["/data","/opt/nginx","/opt/config"]

EXPOSE 9000

CMD [ "bash", "/ruby-run" ]