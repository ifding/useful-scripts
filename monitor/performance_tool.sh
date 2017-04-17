# tell how long the system has been running
uptime

# display linux tasks
top

# an interactive process viewer for unix
htop

# report processors related statistics
# -A, display all information
mpstat

# display CPU statistics of individual CPU (or) Core
mpstat -P ALL 1

# displays information about the CPU usage, and IO statistics
# -c, displays only the CPU usage
# -d, display only the disk IO
# -n, display only the device and NFS statistics 
iostat

# display the memory usage (including swamp)
# -a, display active and inactive memory information
# -f, display number of forks since last boot
# vmstat 2, to execute every 2 seconds
vmstat

# display amount of free and used memory in the system
free

# print network traffic statistics
nicstat -z 1

# verstatile tool for generating system resource statistics
dstat 1

# collect, report, or save system activity information
sar

# display summary statistics for each protocol
netstat -s

# report statistics for linux tasks
pidstat 1
pidstat -d 1

# strace, trace system calls and signals
# -ttt, the time printed will include the microseconds and the leading portion will be printed
#       as the number of seconds since the epoch.
# -T, Show the time spent in system calls.
# -p, attach to the process with the PID and begin tracing.
strace -tttT -p 12670


# tcpdump, dump traffic on a network
tcpdump -nr /tmp/out.tcpdump

# btrace, perform live tracing for block devices
btrace /dev/sdb 

# iotop, watches IO usage information output
iotop -bod5

# slabtop, display kernel slab cache information in real time
slabtop -sc

# configure kernel parameters at runtime
sysctl -a

# perf, linux profiling with performance counters
# perf stat, obtain event counts
perf stat gzip file1

# perf record, record events for later reporting
perf record -a -g -F 997 sleep 10