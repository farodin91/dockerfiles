FROM farodin91/puppet

RUN useradd -ms /bin/bash samba
WORKDIR /opt

RUN puppet module install thias-samba
RUN apt-get instal samba

ADD run.sh /opt/run.sh
ADD init.pp /opt/init.pp

VOLUME ["/var/log/samba","/data","/etc/samba","/home"]

CMD [ "bash", "/opt/run.sh" ]

EXPOSE 139 445 636