import math 

number = input("gimme a number\n")
border = pow(number, 0.5)
n = 2
factors = []

while n < number:
    x = n
    y = 0
    while number % n == 0:
        y += 1
        number = number / n 
    if y > 0:
        factors.append((n,y))
    n += 1
    print n

print factors
print number
