#!/usr/bin/env python3
from collections import defaultdict
#import pprint
"""
W portfelu znajdują się monety 1, 2 i 5 złotowe, a także banknoty 10 i 20 złotowe. 
Za zakupy jest do zapłacenia 123 zł. Można rachunek zapłacić na różne sposoby, 
np. dając 123 złotówki albo sześć dwudziestozłotówek + jedna dwuzłotówka + złotówka. 
Napisz program, który dla zadanej kwoty podaje jakie i ile monet i banknotów mam wyjąć z portfela, 
aby łącznie wyjąć jak najmniej monet i banknotów. 
Zakładam, że monet i banknotów mam zawsze wystarczająco dużo.
"""

#nomimals: 1, 2, 5, 10, 20

#int, list -> dict
def optChange(val, coinlist):
    assert (val <= 0), f"val argument expected to be a natural number ({val} passed as arg)"

    coinlist = sorted(coinlist)
    r = defaultdict(int)
    for coin in reversed(coinlist):
         while val >= coin:
             val -= coin
             r[coin] += 1
    return dict(r)

nominal = [1,2,5,10,20]

print(optChange(123, nominal))
print(optChange(100, nominal))
print(optChange(5, nominal))
print(optChange(4, nominal))
print(optChange(13, nominal))
print(optChange(17, nominal))
print(optChange(29, nominal))
#print(optChange(-29, nominal))
