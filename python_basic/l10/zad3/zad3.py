
#            VVVVVVVVVV ?        czy powinienem robic nadmiarowy wynik, ale uzywac set-ow zeby miec kazdy wynik tylko raz?
def fun_1(L, R = set()):
    R.add(sum(L))
    for item in L:
        fun_1([x for x in L if x != item],R)
    return R

#a = sorted(fun_1((1,2,3,100)))
#for x in a:
#    print(x)

#---------------------------------------

#def fun_2(L, n):
#    r = []
#    if n == 0:
#        return []
#    for x in L:
#        r.append(L[0] + fun_2(L[x:], n-1))
#    return r
    
#print(fun_2(list(range(4)),2))
