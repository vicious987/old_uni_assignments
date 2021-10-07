#!/usr/bin/env python3
from math import floor, ceil, sqrt
import timeit

def impPrimes(n):
    primes = []
    for x in range(2, n):
        isprime = True;
        for p in primes:
            if p > floor(sqrt(x)):
                break
            if x % p == 0:
                isprime = False;
                break
        if isprime:
            primes.append(x)
    return primes

def lcompPrimes(n):
    return [x for x in range(2, n) if not any([x % p == 0 for p in range(2, ceil(sqrt(x+1)))])]

def functionalPrimes1(n):
    r = range(2, n)
    r = filter(lambda x: x % 2 != 0 or x == 2, r)
    r = filter(lambda x: x % 3 != 0 or x == 3, r)
    r = filter(lambda x: x % 4 != 0 or x == 4, r)
    r = filter(lambda x: x % 5 != 0 or x == 5, r)
    r = filter(lambda x: x % 6 != 0 or x == 6, r)
    return list(r)

def functionalPrimes2(n):
    r = range(2, n)
    for d in range(2, 6):
        r = list(filter(lambda x: x % d != 0 or x == d, r))
    return list(r)

def functionalPrimes(n):
    return list(filter(lambda x: all({x % y != 0 for y in range(2, ceil(sqrt(x+1)))}), range(2,n)))

n = 100
#n = 20
times = 1000
#"""
print(impPrimes(n))
print(lcompPrimes(n))
print(functionalPrimes(n))
#"""

print("imperative approach:", timeit.timeit('impPrimes(n)', globals=globals(), number=times))
print("functional approach:", timeit.timeit('functionalPrimes(n)', globals=globals(), number=times))
print("list comprehension:", timeit.timeit('lcompPrimes(n)', globals=globals(), number=times))
