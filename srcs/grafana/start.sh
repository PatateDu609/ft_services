#!/bin/sh

/telegraf/telegraf &

sed -i "s/admin_user = admin/admin_user = gboucett/" /grafana/conf/defaults.ini
sed -i "s/admin_password = admin/admin_password = gboucett/" /grafana/conf/defaults.ini

cd /grafana/bin
./grafana-server
