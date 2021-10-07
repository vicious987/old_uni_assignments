function isempty(t)
	return next(t) == nil
end

function prop_seq(z, ...)
	if isempty({...}) then
		t = z
	else
		t = {z, table.unpack({...})}
	end

	counter = 0
	s = {}
	for k, _ in pairs(t) do
		counter = counter + 1
		s[k] = false 
		s[k+1] = true
	end
	for k, _ in ipairs(t) do
		counter = counter - 1
	end
	borders = {}
	for k, v in pairs(s) do
		if v then 
			table.insert(borders, k-1)
		end
	end
	return counter == 0, borders
end

t1 = {1,2,3,4,5,6}
t2 = {1, nil, 3, nil, 5, nil} -- 6
t3 = {nil, 2, nil, 4, nil, 6} -- 6
t4 = {['aa'] = 11, ['bb'] = 22, ['cc'] = 33}
t5 = {nil, nil, 3, 4, nil, nil, 7, 8} -- 8
t6 = {'a','b','c'}
t = t1
---[[
ret1, ret2 = prop_seq(t)
print(ret1)
for k,v in pairs(ret2) do
	print(k,v)
end
--]]
