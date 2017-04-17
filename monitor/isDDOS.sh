#!/bin/bash

netstat -antu | awk '$4 ~ /:(22|25|80|2222|443)$/{print $4" "$6}' | sed -n -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/p' |sed -n -e '/ESTABLISHED\|SYN/p' |sed 's/::ffff://' |cut -d: -f1 |xargs -n 1 host 2>/dev/null |awk '{if ($NF ~ /NXDOMAIN/) print $2; else print $NF;}' |sort |uniq -c |sort -nr |awk '($1 >= 2){print $1" cons to "$2" on local addr"}';

netstat -antu | awk '$5 ~ /:(22|25|80|2222|443)$/{print $5" "$6}' | sed -n -e '/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/p' |sed -n -e '/ESTABLISHED\|SYN/p' |sed 's/::ffff://' |cut -d: -f1 |xargs -n 1 host |awk '{if ($NF ~ /NXDOMAIN/) print $2; else print $NF;}' |sort |uniq -c |sort -nr |awk '($1 >= 2){print $1" cons to "$2" on foreign addr"}';