#!/bin/bash
q=64
size_incr=128
t=10

function fun () {
	echo "matrix_size v0 v1-b4 v1-b16 v1-64"
	for (( i = 1, msize=128; i <= $q;i++, msize+=$size_incr)) do
		echo -n "$msize "
		avg=0.0
		for t in $(seq 1 $t); do 
			v=$(./transpose -n $msize -v 0)
			avg=$(echo "$avg + $v" | bc)
		done
		avg=$(echo "$avg / $t" | bc -l)
		echo -n "$avg "
		for bsize in 4 16 64; do
			avg=0.0
			for t in $(seq 1 $t); do 
				v=$(./transpose -n $msize -v 1 -b $bsize)
				avg=$(echo "$avg + $v" | bc)
			done
			avg=$(echo "$avg / $t" | bc -l)
			echo -n "$avg "
		done
		echo
	done
}
fun > results/result3-2.txt
