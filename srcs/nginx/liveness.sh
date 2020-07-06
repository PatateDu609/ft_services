#!/bin/sh

if [ $(ps -ef | grep "/usr/sbin/sshd" | wc -l) -ge 2 ] && [ $(ps -ef | grep "master process nginx" | wc -l) -ge 2 ]; then
	echo "Everything is fine !"
else
	echo "Something is stopped..." && exit 1
fi
