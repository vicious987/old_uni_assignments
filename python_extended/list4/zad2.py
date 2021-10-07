#!/usr/bin/env python3
from math import ceil, floor
import timeit


def lcompPerfect(n):
    return [x for x in range(6,n) if x == sum([y for y in range(1, (x//2+1)) if x % y == 0])]

def functionalPerfect(n):
    return list(filter(lambda x: x == sum(filter(lambda y: x % y == 0, range(1, (x//2+1)))), range(6,n)))

def impPerfect(n):
    perfects = []
    for x in range(6, n):
        s = 0
        for y in range(1, (x//2+1)):
                if x % y == 0:
                    s += y
        if x == s:
            perfects.append(x)
    return perfects



n = 1000
times = 50
print(impPerfect(n))
print(functionalPerfect(n))
print(lcompPerfect(n))

print("imperative approach:", timeit.timeit('impPerfect(n)', globals=globals(), number=times))
print("list comprehension:", timeit.timeit('lcompPerfect(n)', globals=globals(), number=times))
print("functional approach:", timeit.timeit('functionalPerfect(n)', globals=globals(), number=times))
