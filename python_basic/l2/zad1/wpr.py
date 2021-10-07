import random
import math

def random_point():
    x = random.uniform(-1,1)
    return x

def check_if_in_circle(x, y, r):
    r = float(r)
    if (r*r > x*x + y*y):
        return True
    else:
        return False

def count_pi(n):
    m = 0
    for x in range(n):
        if( check_if_in_circle(random_point(),random_point(),1.0) == True ):
            m = m + 1
    return 4 * float(m) / float(n)
#---------------------------------------------------

max_y = 3.7683362359 # log(4) * e

def fun(x):
    return 2.71828 * math.log(x)

def check_if_under_line(x,y):
    if ( y < fun(x)):
        return True
    else:
        return False

def count_space(n):
    under = 0
    for x in range(n):
        if( check_if_under_line( random.uniform(3,4), random.uniform(0, max_y)) ):
            under = under + 1
    return under/n * max_y

#print(count_pi(10000000))
print(count_space(10000))

