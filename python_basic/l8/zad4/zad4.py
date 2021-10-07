# zadanie 4 z 2listy 3

import math

def is_lucky(number, luck):
    n = str(number)
    s = "7"
    s = luck * "7"
    return s in n

def is_prime(number):
    i = 2
    while i < math.sqrt(number):
        if number % i == 0:
            return False
        i += 1
    return True


num = 10 ** 10

def search(x, lu):
    while x > 0:
        if is_lucky(x,lu):
            if is_prime(x):
                return x
        x -= 1
    return False

print(search(num,7))

