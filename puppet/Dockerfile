FROM ubuntu:trusty

RUN apt-get install -qy wget 
RUN mkdir /puppet 

WORKDIR /puppet 

RUN wget -q http://apt.puppetlabs.com/puppetlabs-release-precise.deb 
RUN dpkg -i puppetlabs-release-precise.deb 
RUN apt-get update -q 
RUN apt-get install -qy puppet-common 

CMD puppet agent --no-daemonize --verbose 