FROM farodin91/puppet

USER POSTGRES
WORKDIR /opt

RUN puppet module install puppetlabs-postgresql

ADD run.sh /opt/run.sh
ADD init.pp /opt/init.pp

VOLUME ["/var/lib/postgresql/data","/var/log/postgresql"]

EXPOSE 5432

CMD [ "bash", "/opt/run.sh" ]