#!/bin/sh

if [ $(ps -ef | grep "vsftpd" | wc -l) -ge 2 ]; then
	echo "Everything is fine !"
else
	echo "Something is stopped..." && exit 1
fi
