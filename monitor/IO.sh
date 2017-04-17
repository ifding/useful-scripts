#IO.sh

## iostat, report CPU statistics and IO statistics for devices, partitions and NFS
## display a single history since boot report for all CPU and Devices
iostat

## display a continuous device report at two second intervals
iostat -d 2

## display six reports at two second intervals for all devices
iostat -d 2 6


## print the time for each report displayed
iostat -t

## display statistics in megabytes per second
iostat -m

## display six reports of extended statistics at two second intervals for devices hda and hdb.
iostat -x hda hdb 2 6

## display six reports at two second intervals for device sda and all its partitions (sda1, etc.)
iostat -p sda 2 6

## -d, display the device utilization report
## -x, display extended statistics.
## -k, display statistics in kilobytes per second instead of blocks per second.
iostat -d -x -k 1 1

## report statistics for Linux tasks
pidstat

## report IO statistics
pidstat -d  1


## display five reports of CPU statistics for every active task in the system at two second intervals.
pidstat 2 5

## display five reports of page faults and memory statistics for PID 1643 at two second intervals. 
pidstat -r -p 1643 2 5


## list open files
lsof   
ls /proc/pid/fd

## collect, report, or save system activity information
## -d, report activity for each block device
sar -pd 10 3 

# simple top-like IO monitor
iotop

# report a large amount of valuable information about the system RAM usage.
cat /proc/meminfo 

# /proc/sys/vm/ facilitates the configuration of the Linux kernel's virtual memory (VM) subsystem.
# nr_pdflush_threads, indicates the number of pdflush daemons that are currently running.
cat /proc/sys/vm/nr_pdflush_threads

# IO Scheduler for a hard disk
# noop anticipatory deadline [cfq] 
# cfq: completely fair queuing, an IO scheduler for the Linux kernel and default under many Linux distributions.
# noop: the simplest IO sechduler based upon FIFO queue concept.
# anticipatory, old scheduler which is replaced by cfq.
# deadline: it attempt to guarantee a start service time for a request. 

cat /sys/block/[disk-name]/queue/scheduler

# to set a specific scheduler, simply type the command as follows:
echo {SCHEDULER-NAME} > /sys/block/{DEVICE-NAME}/queue/scheduler

# for example, set noop scheduler, enter:
echo noop > /sys/block/hda/queue/scheduler
