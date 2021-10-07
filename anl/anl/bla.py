import math

def derp(n):
    return pow(2,n+1)/math.factorial(n+1)

def derp2(n):
    return pow(7,n)*(n+1) 
a = pow(10, 10)
for x in range(30):
    print(x, derp2(x), a < derp2(x), a)
