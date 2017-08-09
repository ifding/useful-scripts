20 Linux commands every sysadmin should know

> If your application isn't working - or you're just looking for more information - these 20 commands will come in handy.


## 1. curl

It is useful for determining if your application can reach another service, such as a database, or checking if your service is healthy.

The **-I** option shows the header information and the **-s** option silences the response body.

```sh
$ curl -I -s database:27017
HTTP/1.0 200 OK

$ curl -I -s https://opensource.com
HTTP/1.1 200 OK
```

## 2. python -m json.tool / jq

Sometimes, you want to pretty-print the JSON output to find a specific entry. Python has a bulit-in JSON library that can help with this.

```sh
$ cat test.json
{"title":"Person","type":"object","properties":{"firstName":{"type":"string"},"lastName":{"type":"string"},"age":{"description":"Age in years","type":"integer","minimum":0}},"required":["firstName","lastName"]}
```

To use the Python library, pipe the output to Python with the -m (module) option.

```sh
$ cat test.json | python -m json.tool
{
    "properties": {
        "age": {
            "description": "Age in years",
            "minimum": 0,
            "type": "integer"
        },
        "firstName": {
            "type": "string"
        },
        "lastName": {
            "type": "string"
        }
    },
    "required": [
        "firstName",
        "lastName"
    ],
    "title": "Person",
    "type": "object"
}
```

## 3. ls

lists files in a directory

```sh
$ ./myapp
bash: ./myapp: Permission denied
$ ls -l myapp
-rw-r--r--. 1 root root 33 Jul 21 18:36 myapp
```

## 4. tail

displays the last part of a file

```sh
# -f indicates the "follow", which outputs the log lines as they are written to the file
$ tail -f /var/log/httpd/access_log

# see the last 100 lines of the file
$ tail -n 100 /var/log/httpd/access_log
```

## 5. cat

```sh
$ cat requirements.txt
flask
flask_pymongo
```

## 6. grep

**grep** searches file patterns.

``sh
$ cat tomcat.log | grep org.apache.catalina.startup.Catalina.start
01-Jul-2017 18:03:47.542 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 681 ms
```

## 7. ps

shows process status.
```sh
$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  2 18:55 ?        00:00:02 /docker-java-home/jre/bi
root        59     0  0 18:55 pts/0    00:00:00 /bin/sh
root        75    59  0 18:57 pts/0    00:00:00 ps -ef

$ ps -ef | grep tomcat
root         1     0  1 18:55 ?        00:00:02 /docker-java-home/jre/bi
```

## 8. env

allows you to set or print the environment variables.
```sh
$ env
PYTHON_PIP_VERSION=9.0.1
HOME=/root
DB_NAME=test
PATH=/usr/local/bin:/usr/local/sbin
LANG=C.UTF-8
PYTHON_VERSION=3.4.6
PWD=/
DB_URI=mongodb://database:27017/test
```

## 9. top

displays and updates sorted process information. While it runs, you hit the "C" key to see the full command and reverse-engineer if the process is your application.

## 10. netstat

shows the network status. This command shows network ports in use and their incoming connections.

## 11. ip address

## 12. lsof

lists the open files associated with your application. In Linux, almost any interaction with the system is treated like a file. As a result, if your application writes to a file or opens a network connection, **lsof** will reflect that interaction as a file.

```sh
$ lsof -i tcp:80
$ lsof -p 18311
```

The name of the open file in the list of open files helps pinpoint the origin of the process, specifically Apache.

## 13. df

display free disk space. **-h** option prints out the information in human-readable format.

## 14. du

To retrieve more detailed information about which files use the disk space in a directory, you can use the **du** command. With the **-h** (human-readable) option and the **-s** option for the total size.

```sh
$ du -sh /var/log/*
1.8M  /var/log/anaconda
384K  /var/log/audit
4.0K  /var/log/boot.log
0 /var/log/chrony
4.0K  /var/log/cron
4.0K  /var/log/maillog
64K /var/log/messages
```

## 15. id

To check the user running the application, use the id command to return the user identity. To check your user and group, issue the id command and notice that you are running as the "vagrant" user in the "vagrant" group.

```sh
$ yum -y install httpd
Loaded plugins: fastestmirror
You need to be root to perform this command.
$ id
uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

## 16. chmod

```sh
$ chmod +x test.sh
[vagrant@localhost ~]$ ls -l
total 4
-rwxrwxr-x. 1 vagrant vagrant 34 Jul 11 02:17 test.sh
```

## 17. dig/nslookup

```sh
$ nslookup mydatabase
Server:   10.0.2.3
Address:  10.0.2.3#53

** server can't find mydatabase: NXDOMAIN
```

Using nslookup shows that mydatabase can't be resolved. Trying to resolve with dig yields the same result.

```sh
$ dig mydatabase

; <<>> DiG 9.9.4-RedHat-9.9.4-50.el7_3.1 <<>> mydatabase
;; global options: +cmd
;; connection timed out; no servers could be reached
```

## 18. iptables

**iptables** blocks or allows traffic on a Linux host, similar to a network firewall. This tool may prevent certain applications from receiving or transmitting requests. 

```sh
$ iptables -S
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT DROP
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --sport 22 -j ACCEPT
-A OUTPUT -o eth0 -p udp -m udp --dport 53 -j ACCEPT
```

## 19. sestatus

You usually find SELinux (a Linux security module) enforced on an application host managed by an enterprise. SELinux provides least-privilege access to processes running on the host, preventing potentially malicious processes from accessing important files on the system.

```sh
$ sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      28
```

## 20. history

```sh
$ history
    1  clear
    2  df -h
    3  du
```


## Referenc

- [20 Linux commands every sysadmin should know](https://opensource.com/article/17/7/20-sysadmin-commands)
