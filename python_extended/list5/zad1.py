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

def genPerfect(n):
    for x in range(6, n):
        s = 0
        for y in range(1, (x//2+1)):
                if x % y == 0:
                    s += y
        if x == s:
            yield x 



n = 1000
times = 20
print(impPerfect(n))
print(functionalPerfect(n))
print(lcompPerfect(n))
#print(list(genPerfect(n))) #czy to fair?
for x in genPerfect(n):
    print(x)


print("\t" + 4 * "\t%.15s\t" % ("imp","comp","func","gen"))
for n in [10, 100, 1000]:
    imp = timeit.timeit('impPerfect(n)',globals=globals(), number=times)
    comp = timeit.timeit('lcompPerfect(n)', globals=globals(), number=times)
    func = timeit.timeit('functionalPerfect(n)', globals=globals(), number=times)
    gen =  timeit.timeit('for x in genPerfect(n): pass', globals=globals(), number=times)
    #print(n, imp, comp, func,gen)
    print("%d\t" % n + 4 * "\t%.5f\t" % (imp, comp, func, gen))
