#!/bin/sh

/telegraf/telegraf &

cd /grafana/bin
./grafana-server
