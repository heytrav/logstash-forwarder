#!/bin/bash

docker stop logstash-forwarder && docker rm logstash-forwarder

docker run -i -d -t --name logstash-forwarder docker.domarino.com/logstash-forwarder
