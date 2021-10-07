from random import randint
from random import choice
k = int(input("inp"))
n = 10 ** k
#n = k
f = open(f"rtest{k}","w+") 

f.write(f"{n}\n")
for i in range(n):
    r = i + 1
    f.write(f"{r}\n")
