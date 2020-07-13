#!/bin/sh

openrc default
rc-update add mariadb default
rc-service mariadb setup
rc-service mariadb start

mysql -u root < init.sql

rc-service mariadb stop
mysqld
