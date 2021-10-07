function count(t, value)
	counter = 0
	for k,v in pairs(t) do
		if v == value then
			counter = counter + 1
		end
	end
	return (counter > 0) and counter or nil
end

---TESTCASES
t1 = {1,2,3,5,6,7}
t2 = {1,1,1,0,1,0}
t3 = {'a','b','r','a','k','a','d','a','b','r','a'}
---

print(count(t3, 'a'))
