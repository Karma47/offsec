# offsec
self written scripts.

To enum the host addresses 
~    host google.com 
~    host -t ns google.com
~    host -t mx google.com
~    host www.google.com
~    host idontexist.google.com 

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

now write a bash script to run a "host" command against these parameters on the "domain.com" .. i am going to go for google here.
for name in $(cat list.txt);
    do
        host $name.google.com | hrep "has address" | cut -d " " f1,4
    done    

run the script and look at the results.

RevLookup Bash script:
replace the IP rage and host address 
$ cat revlookup.sh 
#!/bin/bash
for ip in $(seq 20 225);
 do
  host 96.45.82.$ip
 done
