#!/bin/sh

: ${LUMBERJACK_HOST:=devel-iwmn.com}
sed -i  's/LUMBERJACK_SERVICE_HOST/'"$LUMBERJACK_SERVICE_HOST"'/g' /etc/logstash-forwarder.conf
sed -i  's/LUMBERJACK_SERVICE_PORT/'"$LUMBERJACK_SERVICE_PORT"'/g' /etc/logstash-forwarder.conf
sed -i  's/LUMBERJACK_HOST/'"$LUMBERJACK_HOST"'/g' /etc/logstash-forwarder.conf


if [ "$INTERACTIVE" = 1 ]; then
    /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && /bin/bash
else
    /usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf
fi
