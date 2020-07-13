FROM alpine:latest

EXPOSE 3000

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache vim libc6-compat openrc
COPY start.sh .
RUN chmod u+x start.sh
COPY grafana.tar.gz .
RUN tar -xzf grafana.tar.gz

ENTRYPOINT ./start.sh
