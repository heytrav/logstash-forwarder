FROM ubuntu:trusty

RUN  apt-get  update && \
  apt-get -qy install -y \
    supervisor \
    rsyslog 

ADD logstash-forwarder /opt/logstash-forwarder/



RUN sed -i 's/$ActionFileDefaultTemplate/#$ActionFileDefaultTemplate/' /etc/rsyslog.conf
ADD supervisor/ /etc/supervisor/conf.d/
RUN chmod +x logstash-forwarder
ADD logstash-forwarder /etc/

EXPOSE 514/udp
EXPOSE 10514

CMD ["./docker_start.sh"]
