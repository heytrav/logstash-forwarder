FROM ubuntu:trusty

RUN apt-get -qy install  ca-certificates wget --no-install-recommends && \
  wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
  echo 'deb http://packages.elasticsearch.org/logstashforwarder/debian stable main' | \
       tee /etc/apt/sources.list.d/logstashforwarder.list && \
  apt-get -qq update && \
  apt-get -qy install  logstash-forwarder && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p  /usr/local/logstash-forwarder \
              /etc/logstash-forwarder 

WORKDIR /usr/local/logstash-forwarder
RUN \
    wget https://raw.github.com/elasticsearch/logstash-forwarder/master/logstash-forwarder.init \
    -O logstash-forwarder

RUN chmod +x logstash-forwarder
ADD logstash-forwarder /etc/logstash-forwarder/
ADD supervisor/ /usr/local/logstash-forwarder/
VOLUME ["/opt/logstash-forwarder", "/etc/logstash-forwarder", "/usr/local/logstash-forwarder"]

