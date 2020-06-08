FROM alpine:latest

#install all requirements (openssh for ssh and openssl for https)
RUN apk update
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl

#add the user for nginx
RUN adduser -D -g 'www' www

RUN mkdir -p /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx

COPY ./srcs/index.html /www/index.html
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./setup.sh .

CMD sh ./setup.sh

EXPOSE 80
