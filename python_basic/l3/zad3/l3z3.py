#Mateusz Obara lista 3 zadanie 3
import math
import copy
           
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

number_of_digits = 5 
number_of_7 = 3
maximum = 10**number_of_digits 

number_pool = list(range(2,maximum))

del number_pool[::2]                  ##szybkie sito zmniejszajace nam pule liczb o 2/3
del number_pool[::3]

number_pool_copy = copy.copy(number_pool)

for number in number_pool_copy:
    if not is_prime(number) or not is_lucky(number,number_of_7):
        number_pool.remove(number)

print(number_pool)
