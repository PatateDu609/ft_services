FROM alpine:latest

VOLUME [ "/home/gboucett" ]

EXPOSE 21 20 30032 30033 30034

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache openssl vim openssh supervisor vsftpd
COPY supervisor.conf /etc/supervisor/supervisor.conf
COPY vsftpd.conf /etc/vsftpd.conf
COPY liveness.sh .
RUN chmod u+x liveness.sh

COPY telegraf.tar.gz .
RUN tar -xzf telegraf.tar.gz

RUN mkdir -m 755 /etc/telegraf
COPY telegraf.conf /etc/telegraf

# configuring ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/ftps.key -out /etc/ssl/certs/ftps.pem -subj "/C=FR/ST=Paris/L=Paris/O=Gboucett/OU=Teyber/CN=size.com"

# configuring ftps
RUN addgroup ftpgroup
RUN adduser gboucett -G ftpgroup -h /home/gboucett -D
RUN echo "gboucett:gboucett" | chpasswd
RUN chown -R gboucett /home/gboucett

CMD supervisord -c /etc/supervisor/supervisor.conf
