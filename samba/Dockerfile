FROM farodin91/puppet

USER samba
WORKDIR /opt

RUN puppet module install alkivi-samba

ADD run.sh /opt/run.sh
ADD init.pp /opt/init.pp

VOLUME ["/var/log/samba","/data"]

CMD [ "bash", "/opt/run.sh" ]