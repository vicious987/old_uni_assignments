#!/usr/bin/env python3
from math import sqrt, floor
def f(x):
    n = 0
    s = 1
    while(x >= 0):
        x -= s
        s += 2
        n += 1
    return n - 1

testlist = [10, 20, 99, 101,100]
for t in testlist:
    print(f(t) == floor(sqrt(t))) 
