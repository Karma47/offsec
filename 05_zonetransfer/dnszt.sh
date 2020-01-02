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
