import math
def viete(a,b,c):
    d = b*b - 4*a*c
    if d < 0:
        return None
    elif d == 0:
        return -b/(2*a)
    else:
        if b < 0:
            x1 = (-b + math.sqrt(d)) / (2*a)
        else:
            x1 = (-b - math.sqrt(d)) / (2*a)
    x2 = c / (x1 * a)
    return (x1,x2)

def normal(a,b,c):
    d = b*b - 4*a*c
    if d < 0:
        return None
    elif d == 0:
        return -b/(2*a)
    else:
        x1 = (-b + math.sqrt(d)) / (2*a)
        x2 = (-b - math.sqrt(d)) / (2*a)
    return (x1,x2)


print(viete(123.398,999.190239,5.000000123))
print(normal(123.398,999.190239,5.000000123))
