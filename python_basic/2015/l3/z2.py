def is_prime(x):
    n = 2
    while n < int(pow(x,0.5)):
        n += 1
        if x % n == 0:
            return False
    return True

border = input("gimme border\n")

def create_perfect_f(border):
    perfect_list = []
    l = [1,2]
    number = 2

    while True :
        print l
        print perfect_list
        if is_prime(sum(l)):
            perfect_list.append(l[-1] * sum(l))
        l.append(pow(2,number))
        number += 1
        if perfect_list[-1] > border:
            del perfect_list[-1]
            break
    return perfect_list

print creatte_perfect_f(border)

def create_perfect_l(border):
    l = range(10)
    l = [ 2 ** x for x in l]
    l = [ sum(l[::w

