function max2(a,b)
	if a == nil then
		return b
	elseif b == nil then
		return a
	else 
		return (a > b) and a or b
	end
end

function max3(a,b,c)
	return max2(max2(a,b), c)
end


---[[TESTCASES
t1a, t1b, t1c = 23, 42, 12
t2a, t2b, t2c = nil, nil, nil
t3a, t3b, t3c = 1, nil, 3
t4a, t4b, t4c = nil, nil, 2

print(max3(t1a, t1b, t1c))
print(max3(t2a, t2b, t2c))
print(max3(t3a, t3b, t3c))
print(max3(t4a, t4b, t4c))
--]]
