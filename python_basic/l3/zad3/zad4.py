import math

def is_prime(n):
    if n == 1: return False
    for x in range(2,int(math.sqrt(n) + 1)):
        if n%x == 0: return False
    return True

def is_lucky(n, number_of_7s):
    substring = ""
    for x in range(number_of_7s):
        substring += "7"
    if substring in str(n):
        return True
    else:
        return False

def zad4(number_of_digits, number_of_7):
    l = []
    for x in range(number_of_7):
        l.append(7)
    for x in range(number_of_digits - number_of_7):
        l.append(9)
    

