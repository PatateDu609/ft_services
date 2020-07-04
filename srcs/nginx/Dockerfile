FROM alpine:latest

EXPOSE 80
EXPOSE 443
EXPOSE 22

# Installing all requirements
RUN apk update && apk add --no-cache nginx openrc openssl vim curl wget openssh

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

# configuring nginx properly
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

RUN openrc
RUN touch /run/openrc/softlevel

CMD /etc/init.d/sshd start ; nginx -g "daemon off;"
