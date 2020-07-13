FROM alpine:latest

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache vim mariadb mariadb-client openrc
RUN addgroup mysql mysql

COPY my.cnf /etc/mysql/my.cnf
COPY start.sh ./start.sh
COPY init.sql .
RUN chmod u+x ./start.sh

ENTRYPOINT ./start.sh
