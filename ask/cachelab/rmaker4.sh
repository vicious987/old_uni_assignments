#!/bin/bash
t=15

function fun () {
	echo "matrix_size randwalk1 randwalk2"
	for size in 512 1024 2048 4096  8192 16384 32768; do
		echo -n "$size "
		for variant in 0 1 ; do
			avg=0.0
			for t in $(seq 1 $t); do 
				v=$(./randwalk -n $size -v $variant -s 15 -t 13 -S 0xea3495cc76b34acc)
				avg=$(echo "$avg + $v" | bc)
			done
			avg=$(echo "$avg / $t" | bc -l)
			echo -n "$avg "
		done
		echo
	done
}

fun > results/result4_.txt
