FROM ubuntu:precise
MAINTAINER Music Glue "devteam@musicglue.com"

ADD ./config/10gen.list /etc/apt/sources.list.d/10gen.list
ADD ./scripts/ /scripts

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN apt-get update -qq
RUN apt-get install -y mongodb-10gen > /dev/null 2>&1
RUN apt-get install -y sudo > /dev/null 2>&1

ADD ./config/mongodb.conf /etc/mongodb.conf

RUN mkdir -p /data && chown -R mongodb:mongodb /data

EXPOSE 27017
VOLUME ["/data"]
#USER mongodb
#ENTRYPOINT ["/bin/bash"]