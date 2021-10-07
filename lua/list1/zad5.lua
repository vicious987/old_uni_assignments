function maxt(t)
	_, m = next(t)
	for _, v in pairs(t) do
		m = (m > v) and m or v
	end
	return m
end

---[[TESTCASES
t1 = {3,5,123,5,4}
t2 = {2.24,3.22,2,3,2,3}
t3 = {}
t4 = {'abc','bcd','ade','cde','eaa','aaz'}
tests = {t1,t2,t3,t4}
--]]

for k,v in ipairs(tests) do
	print(k, maxt(v))
end
