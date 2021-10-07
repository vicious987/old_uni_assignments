function rfib(n)
	if n == 0 then
		return 0
	elseif n == 1 then
		return 1
	else
		return rfib(n-1) + rfib(n-2)
	end
end

function _fib(n, last, sc_last)
	if n == 0 then
		return sc_last
	elseif n == 1 then
		return last
	else
		return _fib(n-1, last + sc_last, last)
	end
end

function fib(n)
	return _fib(n,1,0)
end


---[[TESTCASES
t1 = 0
t2 = 1
t3 = 2
t4 = 4
t5 = 5
t6 = 6
t7 = 7
t8 = 10
t9 = 20
tests = {t1,t2,t3,t4,t5,t6,t7,t8,t9}
--]]

for k,v in ipairs(tests) do
	print(k, rfib(v), fib(v)) 
end

		
