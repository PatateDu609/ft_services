FROM alpine:latest

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk upgrade && apk add --no-cache vim mysql mysql-client supervisor
COPY supervisor.conf /etc/supervisor/supervisor.conf
COPY liveness.sh ./liveness.sh
COPY my.cnf /etc/my.cnf
COPY init.sql .
RUN chmod u+x ./liveness.sh

RUN mkdir -p /run/mysqld

RUN mysql_install_db --user=root
RUN mysqld --user=root --bootstrap < init.sql

CMD supervisord -c /etc/supervisor/supervisor.conf
