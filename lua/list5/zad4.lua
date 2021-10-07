function cache(f)
	local t = {}
	local function mf(x, ...)
		if select('#', ...) > 0 then
			t[x] = t[x] or cache(function(...) return f(x, ...) end)
			return t[x](...)
		else
			t[x] = t[x] or f(x)
			return t[x]
		end
	end
	return mf
end


function aaa(n)
	return n + 10
end

function bbb(x,y,z)
	return x + y + z
end


a = cache(aaa)
b = cache(bbb)

print(a(10))
print(a(10))

print(b(5,10,15))
print(b(5,10,15))

function rfib(n)
	if n < 2 then
		return n
	else
		return rfib(n-1) + rfib(n-2)
	end
end

print(rfib(33))
print(rfib(33))
mfib = cache(rfib)
print(mfib(33))
print(mfib(33))
