#!/bin/bash

# monitor system, cpu memory io network
# sar command is used to collect, report & save CPU, Memory, I/O usage in Unix
# i.e. CentOS 7, yum install sysstat
# @Usage
# $ ./monitor-system.sh
#

EVERY=10
TIMES=30

LOG_PATH="monitor_logs"

if ! [ -d $LOG_PATH ]; then
    mkdir -p $LOG_PATH
fi

cur_date="`date +%Y%m%d`"

top_log_path=$LOG_PATH'/top_'$cur_date'.log'
cpu_log_path=$LOG_PATH'/cpu_'$cur_date'.log'
memory_log_path=$LOG_PATH'/memory_'$cur_date'.log'
io_log_path=$LOG_PATH'/io_'$cur_date'.log'
network_log_path=$LOG_PATH'/network_'$cur_date'.log'

# total performance monitor
top -s $EVERY -n $TIMES >> $top_log_path 2>&1 &

# cpu monitor
sar $EVERY $TIMES >> $cpu_log_path 2>&1 &

# memory monitor
vmstat $EVERY $TIMES >> $memory_log_path 2>&1 &

# IO monitor
iostat $EVERY $TIMES >> $io_log_path 2>&1 &

# network monitor
sar -n DEV $EVERY $TIMES >> $network_log_path 2>&1 &
