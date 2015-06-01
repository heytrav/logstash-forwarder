FROM ubuntu:trusty

RUN  apt-get  update && \
  apt-get -qy install -y \
    supervisor \
    rsyslog && \
    apt-get clean

ADD logstash-forwarder /opt/

RUN sed -i 's/$ActionFileDefaultTemplate/#$ActionFileDefaultTemplate/' /etc/rsyslog.conf
ADD supervisor/ /etc/supervisor/conf.d/
ADD logstash-forwarder.conf /etc/
ADD cron.hourly /etc/cron.hourly
ADD rsyslog.d /etc/rsyslog.d
