FROM ubuntu:trusty

RUN  apt-get  update && \
  apt-get -qy install -y \
    supervisor \
    rsyslog

ADD logstash-forwarder /opt/

RUN sed -i 's/$ActionFileDefaultTemplate/#$ActionFileDefaultTemplate/' /etc/rsyslog.conf
ADD supervisor/ /etc/supervisor/conf.d/
ADD logstash-forwarder.conf /etc/

EXPOSE 514/udp
EXPOSE 10514
WORKDIR /usr/local/logstash-forwarder
ADD docker_start.sh /usr/local/logstash-forwarder

CMD ["./docker_start.sh"]
