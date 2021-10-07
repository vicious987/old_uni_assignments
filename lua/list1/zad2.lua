function add1(x)
	return x + 1
end

function conc_bla(x)
	return x .. '-bla'
end

function printp(t)
	for k, v in pairs(t) do
		print(k, v)
	end
end

function maptab(tab, func)
	rettab = {}
	for k, v in pairs(tab) do
		rettab[k] = func(tab[k])
	end
	return rettab
end
	

---TESTCASES
test1 = {11, 22, 33}
test2 = {'a','b','c'}
test3 = {[0]=2.54, [13]=7, ['somekey']='someval'}
---]]


printp(maptab(test3, conc_bla))
