
# Sorting according to size, the first 15 file or directory
du -xB M --max-depth=2 /var | sort -rn | head -n 15

# list all the sub directory file size
du -h --max-depth=1

# list the top 10 largest size
du -s * | sort -n | tail

# according to size of directory
du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'

# list the file tree of the path
du -h /path | sort -h

# monitor the size of directory every 60s
watch -n60 du /var/log/messages

# recursive deletion of .svn directory 
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf

# list the disk usage
df -P | column -t
df -h

# monitor disk usage
watch -d -n 5 df

# list the inode usage
df -i  <partition>

# sort according to every disk usage
df -h | grep -v ^none | ( read header ; echo "$header" ; sort -rn -k 5)

# check the disk usage
df -x tmpfs | grep -vE "(gvfs|procbususb|rootfs)"

# check partition usage
fdisk -l /dev/sda

# show all the partitions 
fdisk -l       

# show sectors          
fdisk -u          
 
# show the block number of partition   
fdisk -s partition       

# Assessing disk performance with the iostat command
iostat -m -d /dev/sda1

#hdparm is a command-line utility to set and view ATA and SATA hard disk drive hardware parameters
hdparm -t /dev/sda

# check all the link of one file 
find -L / -samefile /path/to/file -exec ls -ld {} +

# check the top 5 largest files
find . -type f -exec ls -s {} \; | sort -n -r | head -5

# check the file 365 ago and delete
find ./ -type f -mtime +365 -exec rm -f {} \;

# check the files larger than 100M
find . -type f -size +100M
