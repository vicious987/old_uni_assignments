#!/usr/bin/env python3

"""
Zaprogramuj funkcję romb(n), która wypisze romb o wysokości 2*n−1. 
Poniżej przykład takiego rombu dla wywołania romb(4):

    #
   ###
  #####
 #######
#########
 #######
  #####
   ###
    #
"""

def romb(n):
    assert (n > -1), f"Rhombus height expected to be more than zero! ({n} given as arg)"
    width = 2*n + 1
    r = [(x*'#').center(width) for x in range(1, width+1, 2)]
    r = r + [x for x in reversed(r[:-1])]
    return "\n".join(r)

print(romb(4))
print(romb(5))
print(romb(6))
print(romb(0))
#print(romb(-1))
