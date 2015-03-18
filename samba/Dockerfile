FROM farodin91/puppet

RUN useradd -ms /bin/bash samba
WORKDIR /opt

RUN puppet module install thias-samba

USER samba

ADD run.sh /opt/run.sh
ADD init.pp /opt/init.pp

VOLUME ["/var/log/samba","/data","/etc/samba","/home"]

CMD [ "bash", "/opt/run.sh" ]