#!/bin/sh
 
# -q quiet
# -c nb of pings to perform
# @Usage
# $ ./ping_ok.sh
 
ping -q -c5 facebook.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "ok"
fi
