function printt(t)
	for k,v in pairs(t) do
		print(k, v)
	end
end

function factorize(x)
	facts = {}
	l = math.sqrt(x)
	i = 2
	while x > 1 do
		--print(i, x)
		while(x%i == 0) do
			x = x / i
			facts[i] = (facts[i] or 0) + 1
			--print('incr facts', i)
		end
		i = i + 1
	end
	return facts
end

--TESTCASES
t1 = 100
t2 = 123
t3 = 7
t4 = 25


printt(factorize(t3))
