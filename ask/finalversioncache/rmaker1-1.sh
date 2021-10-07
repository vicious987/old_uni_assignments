#!/bin/bash
t=15
function fun () {
	echo "matrix_size mult0 mult1 mult2 mult3"
	for size in 128 192 256 320 384 448 512 576 640 704 768; do
		echo -n "$size "
		for variant in 0 1 2 3; do
			avg=0.0
			for t in $(seq 1 $t); do 
				v=$(./matmult -n $size -v $variant)
				avg=$(echo "$avg + $v" | bc)
			done
			avg=$(echo "$avg / $t" | bc -l)
			echo -n "$avg "
		done
		echo
	done
}
fun > results/result1-1.txt
