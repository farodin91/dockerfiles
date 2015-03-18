FROM farodin91/puppet

USER git
WORKDIR /opt

RUN puppet module install spuder-gitlab

ADD run.sh /opt/run.sh
ADD init.pp /opt/init.pp


EXPOSE 22
EXPOSE 80
EXPOSE 443

VOLUME ["/home/git/data","/var/log/gitlab"]

CMD [ "bash", "/opt/run.sh" ]