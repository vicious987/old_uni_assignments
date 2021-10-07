lib = require 'zad'

print "summation"
print("(1,2,3,4,5,6,7,8,9)", lib.summation(1,2,3,4,5,6,7,8,9))
print("()", lib.summation())
print("")


print "reduce"
print("summation, {1,2,3,4,5})", lib.reduce(lib.summation, {1,2,3,4,5}))
print("summation, {1,2,3,4,5},10)", lib.reduce(lib.summation, {1,2,3,4,5},10))


print("")
print "merge"
r = lib.merge({a = "ok_a"}, {a = "fail_a", b = "ok_b"}, {b = "fail_b"}, {c = "ok_c"})
print '{a = "ok_a"}, {a = "fail_a", b = "ok_b"}, {b = "fail_b"}, {c = "ok_c"}'
print('r.a', r.a)
print('r.b', r.b)
print('r.c', r.c)
print("")


print"rev"
t = {1,2,3}
t = lib.reverse(t)
print("{1,2,3}")
for i,v in ipairs(t) do
	print(i, v)
end
print("")


print"filter"
function fun(x)
	return x >= 5
end
print("fun(x) return x >= 5), {1,6,2,7,3,8}")
s = lib.filter(fun, {1,6,2,7,3,8})
for i,v in ipairs(s) do
	print(i, v)
end
