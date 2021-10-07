#!/usr/bin/env bash
for x in www.ii.uni.wroc.pl www.uj.edu.pl; do
	echo "$x"
	nslookup $x 
	nslookup -type=MX $x
done
