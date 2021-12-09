#!/usr/bin/env python
#!Developer Osama Mahmood
#!Email : osama.mahmood40@gmail.com
#!Website : http://securitytraning.com

from socket import * 
import os

if os.name == 'nt':
	os.system('cls')
else:
	os.system('clear')


print "*******************************************"
print "************Simple Port Scanner************"
print "*******************************************"

if __name__ == '__main__':
    targetserver = raw_input('Enter host to scan: ')
    targetIP = gethostbyname(targetserver)
    print 'Ready to scan :3 ', targetIP

    #scan reserved ports
    for i in range(1, 1025):
        s = socket(AF_INET, SOCK_STREAM)

        result = s.connect_ex((targetIP, i))

        if(result == 0) :
            print 'Port %d: OPEN' % (i,)
        s.close()

print '***********************************************'
print "Scanning finished"
print '***********************************************'
