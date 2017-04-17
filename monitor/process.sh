
top

ps
# a=show processes for all users
# u=display the process's user/owner
# x=also show processes not attached to a terminal
ps aux

ps -f -u www-data 

## -C search via name
ps -C apache2

## --sort  according to cpu usage, the top 5, -pcpu descending, pcpu ascending
ps aux --sort=-pcpu | head -5 

##-f print the layer structure by tree
ps -f --forest -C apache2 

## show all child processes of parent process
ps -o pid,uname,comm -C apache2
ps --ppid 2359 

## show all threads of one process 
ps -p 3150 -L 

## show the execution time of process
ps -e -o pid,comm,etime 

## monitor "ps"
watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15' 

## pstree, list the current process and tree structure
pstree

## While running a job you can		Shortcut
## suspend a jobs 					ctrl -z
## terminate a job					ctrl -c
## Function											Command
## Move a suspended job to the foreground			fg
## Continue a suspended job in the background		bg
## List all jobs									jobs
## Kill a job (%N where N is the job number)		kill %N && fg
## Start a job directly in the background			command &
jobs

## check the background process
jobs -p

## kill 12 job number
kill 12

## SIGNINT  2,kill 123, same with Ctrl + C
kill -2 123

##SIGKILL(9), forcefully terminate
kill -9 123

## kill peidalinux
kill -u peidalinux
kill -9 $(ps -ef | grep peidalinux) 

## move 123 to the foreground
fg 123

## continue 123 in the background
bg  123

## when you execute a job in bg, and logout from the session, your process will get killed.
## you can avoid this use serveral methods:
## executing the job with nohup, or making it as batch job using at, batch or cron command.

## Nohup stands for no hang up. the standard output will be redirected to nohup.out file
nohup command > myout.file 2>&1 &

## to submit a job with the `at` command, first enter:
##at runtime
at 12:00  //executes command at 12:00

## lists the user's pending jobs, unless the user is the superuser
atq

## delete jobs, identified by their job number
atrm 1 //delete 1

## nice is used to invoke a utility or shell script with a particular priority.
## a niceness of -20 is the highest and 19 is the lowest priority.
## the default niceness for precesses is inherited from its parent prcess and is usually 0
nice [-n <priority>][--help][--version][command]
nice -n 5 ls

## sleep command
date;sleep 1m;date

## renice alters the schedulint priority of a running process.
renice 16 -p 13245  //13245: old priority 10, new priority 16
 
## pmap, report memory map of a process, pmap PID
pmap 20367


## crontab is a list of commands that you want to run on a regular schedule,
## and also the name of the command used to manage that list.

## crontab job scheduler
## *　　*　　*　　*　　*　　command
## m h dom mon dow command
## m, 1~59, minute of the hour
## h, 1~23, the hour of day
## dom, 1~31, the day of month
## mon, 1~12, the month of the year
## dow, 0~6, the day of the week
## command, which is the command to be run.

## For example, you can run a backup of all your user accounts
## at 5 a.m every week with:
## 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/

## to edit the crontab, use this command, this will open in vi or vim
crontab -e

## remove your crontab so that there no jobs are ever executed by cron
crontab -r

## display the current crontab
crontab -l

## More examples
## Run the shell script /home/melissa/backup.sh on January 2 at 6:15 A.M.
15 6 2 1 * /home/melissa/backup.sh

## every night 21:30 restart apache
30 21 * * * /usr/local/etc/rc.d/lighttpd restart

## 1st, 10 and 22 each month 4:45 restart apache
45 4 1,10,22 * * /usr/local/etc/rc.d/lighttpd restart

## every Sat, Sun 1:10 restart apache
10 1 * * 6,0 /usr/local/etc/rc.d/lighttpd restart

## every day,from 18:00 through 23:00,every 30 minutes restart apache
0,30 18-23 * * * /usr/local/etc/rc.d/lighttpd restart

## every day, from 23:00 through 7:00, every one hour restart apche
* 23-7/1 * * * /usr/local/etc/rc.d/lighttpd restart


　　