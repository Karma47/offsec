#!/bin/bash

for ip in $(seq 0 255);
	do
		ping -b -c 1 192.168.3.$ip | grep "from" | cut -d " " -f4 | cut -d ":" -f1 & >/dev/null | more
	done
