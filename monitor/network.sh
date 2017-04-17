#/bin/sh

# check the header of http request 
tcpdump -s 1024 -l -A -n host 192.168.9.56
tcpdump -s 1024 -l -A src 192.168.9.56 or dst 192.168.9.56
sudo tcpdump -A -s 1492 dst port 80

# check host (192.168.0.5) communication 
sudo tcpdump -i eth0 src host 192.168.0.5

# check the tcp packet of eth0 http request
tcpdump -i eth0 port http
tcpdump -i eth0 port http or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|userna me:|password:|login:|pass |user '


# check the packet of tcp, udp, icmp but not ssh
tcpdump -n -v tcp or udp or icmp and not port 22


# check the packet of http request
sudo tcpdump -i eth0 port 80 -w -

# filter the get host header of http response 
sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "GET \/.*|Host\: .*"

# the response packet of DNS query request 
sudo tcpdump -i en0 'udp port 53'

# nmap -sP, Ping echo to scan a subnet 
nmap -sP 192.168.0.1
nmap -sP 192.168.0.0/24
nmap -O www.baidu.com

# netstat, print network connections, routing tables and interface statistics so on
netstat -a
netstat -nlp

# netcat to scan ports
nc -z -v -n 172.31.100.7 21-25

# netcat to connect port 21
nc -v 172.31.100.7 21

# print routing tables
route

# tell how long the system has been running, how many users are currently logged on
# and the system load averages for the past 1,5,and 15 minutes.
uptime

# iftop, display bandwidth usage on an interface by host, i.e. eth1
iftop -i eth1 

# display bandwidth rates in bytes/sec rather than bits/sec
iftop -B 

# don't do hostname lookups
iftop -n 

# don't resolve port number to service names
iftop -N 

# specifies an Ipv4 network for traffic analysis 
iftop -F 192.168.1.0/24 or 192.168.1.0/255.255.255.0 

# diplays the current network usage, i.e. eth0
nload -n eth0

# interactive colorful IP LAN monitor that generates various network statistis including TCP
# info, UDP counts, ICMP and OSPF informa-tion, Ethernet load info, node stats, IP checksum errors, 
# and others. More powerful than nload
iptraf

# ifconfig, configure a network interface
# it is obsolete, for replacement check ip addr and ip link. For statistics use ip -s link.
ifconfig


# query or control network driver and hardware settings
ethtool -i eth0

# statistics devname
ethtool -S

# set speed in Mb/s.
ethtool speed <10|100|1000>


# configure a wireless network interface
iwconfig
iwconfig <interface> essid <network name>

#wget
wget -S --spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

# check mac address
cat /sys/class/net/*/address

# check ip address of eth0
ifconfig eth0 | awk '/inet addr/ {split ($2,A,":"); print A[2]}'

# use curl to check the web page's domain name
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

#talnet
telnet localhost 6666

# check all interface
awk '{print $1}' /proc/net/dev|grep :|sed "s/:.*//g"

# check DNS server verion
nslookup -q=txt -class=CHAOS version.bind NS.PHX5.NEARLYFREESPEECH.NET
