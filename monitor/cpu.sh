
# limit one process's cpu usage
sudo cpulimit -p pid -l 50
ps -eo %cpu,args | grep -m1 PROCESS | awk '{print $1}'

# sort the current process according to memory and cpu
ps aux --sort=%mem,%cpu

# sorting according to cpu usage
ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed "/^ 0.0 /d"

# check the cpu number of current system
grep "processor" /proc/cpuinfo | wc -l	
grep -c -e '^cpu[0-9]\+' /proc/stat

# check the cpu information
cat /proc/cpuinfo

# check the model name of cpu
grep "model name" /proc/cpuinfo

# check the system bit is 64 or 32
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits
getconf LONG_BIT | grep '64'
java -version

# check the cpu MHz
awk -F": " '/cpu MHz\ */ { print "Processor (or core) running speed is: " $2 }' /proc/cpuinfo ; dmidecode | awk -F": " '/Current Speed/ { print "Processor real speed is: " $2 }'

# check every process cpu usage each cpu
ps ax -L -o pid,tid,psr,pcpu,args | sort -nr -k4| head -15 | cut -c 1-90

# check interrupts
cat /proc/interrupts

# check cpu core numbers
cat /proc/cpuinfo | grep "cpu cores" | uniq | awk -F: '{print $2}'

# The number of siblings on a processor is the total number of execution units within that processor. 
# This will include both additional cores and hyperthreading.
cat /proc/cpuinfo | grep "siblings"

# The "intr" line gives counts of interrupts serviced since boot time, 
# for each of the possible system interrupts. The first column is the total of all interrupts serviced; 
# each subsequent column is the total for that particular interrupt.
cat /proc/stat  | grep intr
