#!/bin/bash
for server in $(host -t ns annauniv.edu);
	do
		host -l annauniv.edu $server;
	done
