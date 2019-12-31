#!/bin/bash

for url in $(cat ms.txt);
	do
		host $url | grep "has address" | cut -d " " -f4
	done
