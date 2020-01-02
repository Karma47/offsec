# offsec
self written scripts.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#1 Enum from a HTML Page:
~ grep -o '[A-Za-z0-9_\.-]*\.*google.com' gindex.html | sort -u
~ host < domain name >
Example:
~ host www.microsoft.com | grep "has address" | cut -d " " -f4

Bash for loop for finding ip address:         
-----------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
for url in $(cat input.txt);
    do
        host $url | grep "has address" | cut -d " " -f4
    done
    
Bash Script
-----------------------------------------------------------------------------------------------------------------------------
Do this in one line of bash script:
~ for url in $(grep -o '[A-Za-z0-9_\.-]*\.*.com' windex.html | sort -u); do host $url| grep "has address" | cut -d " " -f4;done

-----------------------------------------------------------------------------------------------------------------------------
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#2 ~ A selfmade ping script using bash loop: 
#!/bin/bash
    for ip in $(seq 0 255);
        do
            ping -b -c 1 192.168.3.$ip | grep "from" | cut -d " " -f4 | cut -d ":" -f1 & >/dev/null | more
            # replace '192.168.3' with your ip
        done
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#4 To enum the host addresses 
~    host google.com 
~    host -t ns google.com
~    host -t mx google.com
~    host www.google.com
~    host idontexist.google.com

Bash Script
-----------------------------------------------------------------------------------------------------------------------------
Bash script to automate process: (bruteforce)
create a test file that has a list of parameters like www, mx , ns etc.
my list contains these parameters:
$ cat list.txt 
www
mx
mail
pop3
blog
proxy
router
admin
www2
firewall
pop3

Bash Script
-----------------------------------------------------------------------------------------------------------------------------
now write a bash script to run a "host" command against these parameters on the "domain.com" .. i am going to go for google here.
for name in $(cat list.txt);
    do
        host $name.google.com | hrep "has address" | cut -d " " f1,4
    done    
run the script and look at the results.

RevLOokup
-----------------------------------------------------------------------------------------------------------------------------
RevLookup Bash script:
replace the IP rage and host address 
$ cat revlookup.sh 
#!/bin/bash
for ip in $(seq 20 225);
 do
  host 96.45.82.$ip
 done
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 1 Attempting zone transfer:
$ host -t ns annauniv.edu 
annauniv.edu name server ns1.annauniv.edu.

"-t" - type 
"ns" <nameserver>

$ host -l annauniv.edu ns1.annauniv.edu
Using domain server:
Name: ns1.annauniv.edu
Address: 14.139.161.6#53
Aliases: 
annauniv.edu has address 14.139.161.7
annauniv.edu name server ns1.annauniv.edu.
acoe.annauniv.edu has address 14.139.161.45
acoeds.annauniv.edu has address 10.9.63.208
acoedw.annauniv.edu has address 10.9.63.207
acoevs.annauniv.edu has address 10.9.63.230
... 
and a lot more records found.

-----------------------------------------------------------------------------------------------------------------------------
#2 simple script 
$ cat dnszone.sh 
--------------------------------------------------------
#!/bin/bash
for server in $(host -t ns annauniv.edu);
 do
  host -l annauniv.edu $server;
 done

-----------------------------------------------------------------------------------------------------------------------------
# 3 Extensive Script:
$ cat dnszt.sh 
-------------------------------------------------------
#!/bin/bash
# SImple zone transfer bash script
# $1 is the first argument given after the bash script
# check if argument was given, if not, print usage

if [ -z "$1" ];
 then
  echo "[*] Simple Zone Transfer Script"
  echo "[*] Usage : $0 <domain name>"
  exit 0
fi

# if argument was given, identify the DNS Servers for the domain.

for server in $(host -t ns $1);
 do
  host -l $1 $server | grep "has address" | cut -d" " -f1,4;
 done

-----------------------------------------------------------------------------------------------------------------------------
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
