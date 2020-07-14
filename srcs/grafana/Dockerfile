FROM alpine:latest

EXPOSE 3000

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache vim libc6-compat openrc
COPY start.sh .
RUN chmod u+x start.sh
COPY grafana.tar.gz .
RUN tar -xzf grafana.tar.gz
COPY influxdb.yaml /grafana/conf/provisioning/datasources
RUN rm /grafana/conf/provisioning/datasources/sample.yaml
COPY liveness.sh .
RUN chmod u+x liveness.sh

COPY telegraf.tar.gz .
RUN tar -xzf telegraf.tar.gz

RUN mkdir -m 755 /etc/telegraf
COPY telegraf.conf /etc/telegraf

COPY dashboards.yaml /grafana/conf/provisioning/dashboards
RUN rm /grafana/conf/provisioning/dashboards/sample.yaml

COPY ./dashboards /grafana/dashboards/

ENTRYPOINT ./start.sh
