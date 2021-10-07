from decimal import *
import math
import sys

l = 10
getcontext().prec = 1 + l 

def my_strip(word):
    word = word.replace(",", "")
    word = word.replace(".", "")
    word = word.replace("!", "")
    word = word.replace("?", "")
    word = word.replace("'", "")
    word = word.replace(";", "")
    return word

def factorial(n):
	if n<1:
	    return 1
	else:
	    return n * factorial(n-1)

def chudnovsky(n): 
    pi = Decimal(0)
    k = 0
    while k < n:
        pi += (Decimal(-1)**k)*(Decimal(factorial(6*k))/((factorial(k)**3)*(factorial(3*k)))* (13591409+545140134*k)/(640320**(3*k)))
        k += 1
    pi = pi * Decimal(10005).sqrt()/4270934400
    pi = pi**(-1)
    return pi

def find_seq(filename, pi)
    t = open(filename, "r")
    digits = len(pi)
    i = 0
    ret = ""

    for line in f:
        for word in line.split():
            w = my_strip(word)
            if len(w) == pi[0]:
                ret += word
                if i == digits:
                    return ret
                i += 1
            else:
                i = 0
                ret = ""

    return False


pi_string = str(chudnovsky(100))[2:][:l]
pi_digits = []

for x in pi_string:
    pi_digits.append(int(x))

find_seq("test1.txt", pi_digits)
