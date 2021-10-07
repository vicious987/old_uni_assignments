import random
import math

def throw():
    return random.randint(0,1)

def r_number(k):
    s = 0
    p = 1
    for x in range(k):
        s += throw() * p
        p *= 2
    return s


def r_number2(n):
    r = n + 1
    b = int(math.log2(n)) + 1
    while(r > n):
        r = r_number(b)
    return r

def tester(n,t):
    av1 = 0
    av2 = 0
    d1 = {}
    d2 = {}

    for x in range(n+1):
        d1[x] = 0
        d2[x] = 0
    for x in range(t):
        d1[r_number2(n)] += 1
        d2[random.randint(0,n)] += 1

    av1 = float(sum(d1.values()))/(n+1)
    av2 = float(sum(d2.values()))/(n+1)
    r1 = math.sqrt(float(sum([ (x - av1)*(x - av1) for x in d1.values()])) / (n + 1))
    r2 = math.sqrt(float(sum([ (x - av2)*(x - av2) for x in d2.values()])) / (n + 1))
    return (d1,d2)

    #return(r1,r2, abs(r1-r2))

a = tester(20,100000)

print(a[0])
print(a[1])
