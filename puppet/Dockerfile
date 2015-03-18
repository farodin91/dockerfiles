FROM ubuntu:trusty

RUN apt-get update -y 
RUN apt-get install -y wget 
RUN mkdir /puppet 

WORKDIR /puppet 

RUN wget -q http://apt.puppetlabs.com/puppetlabs-release-trusty.deb 
RUN dpkg -i puppetlabs-release-trusty.deb 
RUN apt-get install -y puppetmaster-passenger

CMD puppet agent --no-daemonize --verbose 