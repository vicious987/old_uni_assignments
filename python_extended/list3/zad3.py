#!usr/bin/env/ python3
import timeit
from functools import lru_cache
import sys
@lru_cache(None)
def bestsudan(n, x, y):
#    print(n, x , y)
    if n == 0:
        return x + y
    else:
        if y == 0:
            return x
        else:
            return sudan(   n - 1, 
                            sudan(n, x, y - 1), 
                            sudan(n, x, y - 1) + y)

def sudan(n, x, y):
#    print(n, x , y)
    if n == 0:
        return x + y
    else:
        if y == 0:
            return x
        else:
            return sudan(   n - 1, 
                            sudan(n, x, y - 1), 
                            sudan(n, x, y - 1) + y)
def memo3ar(f):
    cache = {}
    def h(a1, a2, a3):
        triplet = (a1, a2, a3)
        if triplet not in cache:
            cache[triplet] = f(a1, a2, a3)
        return cache[triplet]
    return h


bettersudan = memo3ar(sudan);
x, y =  2, 2

print(timeit.timeit('bestsudan(1,x,y)', globals=globals()))
print(timeit.timeit('bettersudan(1,x,y)', globals=globals()))
print(timeit.timeit('sudan(1,x,y)', globals=globals()))
