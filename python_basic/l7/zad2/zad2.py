def permutate(lst):
    if len(lst) == 0:
        return []
    if len(lst) == 1:
        return [lst]
    else:
        l = []
        for i in range(len(lst)):
            x = lst[i]
            xs = lst[:i] + lst[(i+1):]
            for p in permutate(xs):
                l.append([x]+p)
        return l

w = "ab yz"
r = []
to_remove = []

for p in permutate(list(w)):
    r.append("".join(p))

for i,x in enumerate(r):
    if x[0] == " " or x[-1] == " ": 
        to_remove.append(i)

for x in reversed(to_remove):
    r.pop(x)

for x in r:
    print(x)
