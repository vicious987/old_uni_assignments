frac = require("Fraction")

--f0 = frac.new(7,0)
f1 = frac.new(3,5)
f2 = frac.new(2,4)
f3 = frac.new(512,1024)
f4 = frac.new(5*3*4*11, 5*3*4*17)

print(f1 + f2)
print(f2 * f3)
print(f2 ^ 3)
print(f3 .. "conctest")
print(f1 > f2)
print(f1 < f2)
print(f2 == f3)
print(-f1)
print(frac.point_notation(f1))
print(10 + f1)
print(0.2 + f1)