#!/bin/bash
t=15

function fun () {
	for matrix_size in 1024; do
		echo "matrix_size $matrix_size"
		echo "block_size time"
		for block_size in 4 8 16 32 64 128; do
			avg=0.0
			for t in $(seq 1 $t); do 
				v=$(./matmult -n $matrix_size -v 3 -b $block_size)
				avg=$(echo "$avg + $v" | bc)
			done
			avg=$(echo "$avg / $t" | bc -l)
			echo "$block_size $avg"
		done
		echo
	done
}

fun > results/result1-2.txt
