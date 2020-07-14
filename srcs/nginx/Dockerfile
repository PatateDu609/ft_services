FROM alpine:latest

EXPOSE 80
EXPOSE 443
EXPOSE 22

# Installing all requirements and setting up supervisor and liveness
RUN apk update && apk add --no-cache nginx openssl vim curl wget openssh supervisor
COPY supervisor.conf /etc/supervisor/supervisor.conf
COPY liveness.sh ./liveness.sh
RUN chmod u+x ./liveness.sh

COPY telegraf.tar.gz .
RUN tar -xzf telegraf.tar.gz

RUN mkdir -m 755 /etc/telegraf
COPY telegraf.conf /etc/telegraf

# configuring all elements for nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# configuring ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/site.key -out /etc/ssl/certs/site.pem -subj "/C=FR/ST=Paris/L=Paris/O=Gboucett/OU=Teyber/CN=size.com"

# configuring ssh
RUN rm /etc/ssh/sshd_config
COPY sshd_config /etc/ssh/sshd_config
RUN adduser gboucett -D
RUN echo "gboucett:gboucett" | chpasswd
RUN echo "Welcome into my nginx container :) (by gboucett)" > /etc/motd
RUN ssh-keygen -A

# configuring nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

CMD supervisord -c /etc/supervisor/supervisor.conf
