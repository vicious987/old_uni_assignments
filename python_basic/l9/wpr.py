def change(n,l):
    r = []
    if n == 0:
        return [[]]
    elif len(l) == 0: 
        return []
    elif n < l[0]:
        return []
    else:
        y = change(n, l[1:])
        u = change(n - l[0], l)
        for x in u:
            x.append(l[0])
        r = y + u
    return r

c = change(1,[2,3,7])

for x in c:
    print(x)
