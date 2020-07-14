FROM alpine:latest

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache vim influxdb openrc

COPY telegraf.tar.gz .
RUN tar -xzf telegraf.tar.gz

RUN mkdir -m 755 /etc/telegraf
COPY telegraf.conf /etc/telegraf

RUN mkdir -p /etc/influxdb
RUN chown -R influxdb:influxdb /etc/influxdb
COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY start.sh ./start.sh
RUN chmod u+x ./start.sh

ENTRYPOINT ./start.sh
