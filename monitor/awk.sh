
# delete duplicate line in temp file
awk '!($0 in array) { array[$0]; print }' temp

# display 10 frequently used unix commands 
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10

# check the ip list 
ifconfig -a | awk '/Bcast/{print $2}' | cut -c 5-19

# -antu  Used to display all information with TCP / UDP only numbers.
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'

# display the socket numbers of one process
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l


# display wireless network ip
sudo ifconfig wlan0 | grep inet | awk 'NR==1 {print $2}' | cut -c 6-

# batch rename
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash

# display the list of file handles
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done

# sum of the first row
awk '{s+=$1}END{print s}' temp

# display the most frequently used commands and use times
history | awk '{if ($2 == "sudo") a[$3]++; else a[$2]++}END{for(i in a){print a[i] " " i}}' |  sort -rn | head

# display the file list with the certain timestamp
cp -p `ls -l | awk '/Apr 14/ {print $NF}'` /usr/users/backup_dir

# print current process information in certain format
ps -ef | awk -v OFS="\n" '{ for (i=8;i<=NF;i++) line = (line ? line FS : "") $i; print NR ":", $1, $2, $7, line, ""; line = "" }'

# display the single character
echo "abcdefg"|awk 'BEGIN {FS="''"} {print $2}'

# print record number
ls | awk '{print NR "\t" $0}'

# print the ssh client
netstat -tn | awk '($4 ~ /:22\s*/) && ($6 ~ /^EST/) {print substr($5, 0, index($5,":"))}'

# print the first row, which has different values
awk '!array[$1]++' file.txt

# print the second row, the only value
awk '{ a[$2]++ } END { for (b in a) { print b } }' file

# display all the system partitions
awk '{if ($NF ~ "^[a-zA-Z].*[0-9]$" && $NF !~ "c[0-9]+d[0-9]+$" && $NF !~ "^loop.*") print "/dev/"$NF}'  /proc/partitions

# display all the primer numbers from 2 through 100 
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo

# display from 3 through records
awk 'NR >= 3 && NR <= 6' /path/to/file

# display the file in reversed order
awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }'

# print 9x9 multiplication table
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'
