#Mateusz Obara lista 4 zadanie 4
import random

def randperm(n):
    number_list = list(range(n))
    #number_list_copy = number_list.copy()
    permutation = []

    for x in range(n): #number_list:
        i = random.randint(0,n-1)
        permutation += [number_list.pop(i)]
        n -= 1
    return permutation


print(randperm(10))
