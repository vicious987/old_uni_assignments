class C:
    def __init__(self):
        self.c = "ooo"
    a = "aaa" 
    b = "CCC"
    def f(self):
        print(self.a + self.b)

class D(C):
    b = C.a + "DDD"
    def f(self):
        print(self.a + self.b + " overwritten")

e = C()
d = D()
print(C.a)
print(C.b)
print(D.a)
print(D.b)

