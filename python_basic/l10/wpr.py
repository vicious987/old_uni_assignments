import random

def fun(k, L):
    if k > len(L) or k == 0:
        return False

    r = L[random.randint(0,len(L) - 1)]
    lesser_L = [item for item in L if item < r]
    equal_L = [item for item in L if item == r]
    higher_L = [item for item in L if item > r]

    if len(lesser_L) >= k:
        return fun(k, lesser_L)
    elif len(lesser_L) + len(equal_L) >= k:
        return r
    else:
        return fun(k - len(lesser_L) - len(equal_L), higher_L) 

print(fun(1,[1,0,2,2,3]))
print(fun(3,[1,0,2,2,3]))
print(fun(7,[1,2]))
print(fun(1,[1]))
print(fun(0,[]))
print(fun(0,[213,32,1,1,2,7]))
print(fun(3,[]))
