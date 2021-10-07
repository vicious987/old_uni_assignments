local Myvec = {}
Myvec.mt = {}
--[[
--napisz (w formie modułu) klasę obsługującą wektory. Klasa powinna być inicjalizowana tablicą i obsługiwać operacje arytmetyczne: 
--dodawanie i odejmowanie wektorów, mnożenie i dzielenie przez skalar, unarny minus, oraz mnożenie wektorów jako ich iloczyn skalarny. 
--Oprócz tego przeciąż operator # aby zwracał normę wektora i funkcję to string oraz konkatenację z napisami.
--(Szczegóły implementacji, w tym wygląd konstruktora oraz rezultat funkcji to string nie są narzucone z góry.)
--Przeciąż operację sprawdzającą równość wektora, indeksowanie wektora po współrzędnej oraz iterator ipairs tak,  
--aby  kluczem  dla  każdej  współrzędnej  wektora  był  odpowiadający  jej  wektorbazowy
--]]
--
-- Myvec methods
function Myvec.hi()
	print("hello friend")
end

Myvec._err_table = {}
Myvec._err_table.invalid_arg_new = "vector expects only table of numbers"
Myvec._err_table.bad_size = "size of vectors do not match"
Myvec._err_table.bad_arg = "expects only vectors as args"

function Myvec.new(vector)
	for _, v in ipairs(vector) do
		 assert(type(v) == "number", Myvec._err_table.invalid_arg_new)
	end
	vector.n = #vector
	setmetatable(vector, Myvec.mt)
	return vector 
end

function Myvec.sum(v1, v2)
	assert(v1.n == v2.n, Myvec._err_table.bad_size)
	r = {n = v1.n}
	for i = 1, r.n do
		r[i] = v1[i] + v2[i]
	end
	return Myvec.new(r)
end

function Myvec.sub(v1,v2)
	assert(v1.n == v2.n, Myvec._err_table.bad_size)
	r = {n = v1.n}
	for i = 1, r.n do
		r[i] = v1[i] - v2[i]
	end
	return Myvec.new(r)
end

function Myvec.mult(v1,v2)
	assert(v1.n == v2.n, Myvec._err_table.bad_size)
	ret = 0
	for i = 1, v1.n do
		ret = ret + v1[i] * v2[i] 
	end
	return ret
end

function Myvec.mult_by_scalar(s,v)
	r = {n = v.n}
	for i=1, v.n do
		r[i] = v[i] * s
	end
	return Myvec.new(r)
end

function Myvec.euclider_norm(v)
	r = 0
	for i = 1, v.n do
		r = r + v[i]*v[i]
	end
	return math.sqrt(r)
end

function Myvec.div_by_scalar(s,v)
	r = {n = v.n}
	for i = 1, r.n do
		r[i] = v[i] / s
	end
	return Myvec.new(r)
end

function Myvec.print(v)
	print("vector of size: "..v.n)
	for i = 1, v.n do
		print(i, v[i])
	end
end

function Myvec.choose(v1, v2)
	r = {}
	for i = 1, v1.n do
		if v1[i] * v2[i] ~= 0 then
			table.insert(r, v1[i]*v2[i])
		end
	end
	return table.unpack(r)
end
		
	
function Myvec.rotate_right(v,n)
	if n < 0 then
		n = n % -v.n
		n = v.n + n
	end
	r = {n = v.n}
	for i = 1, v.n do
		if (i+n) % (v.n) == 0 then 	-- szczegolny wypadek gdy cos przechodzi nam na ostatni element- chcemy zeby
			r[v.n] = v[i] 			-- rzeczywiscie przechodzil na ostatni, a nie na zerowy
		else
			r[(i+n) % (v.n)] = v[i]
		end
	end
	return Myvec.new(r)
end

--  Myvec methamethods
--  +, -, *, /, #, ==, ipairs, -x, .., tostring, >>, <<, 

function Myvec.mt.__add(a,b)
	if not (getmetatable(a) == Myvec.mt and getmetatable(b) == Myvec.mt) then
		error(Myvec._err_table.bad_arg)
	end
	return Myvec.sum(a,b)
end

function Myvec.mt.__sub(a,b)
	if not (getmetatable(a) == Myvec.mt and getmetatable(b) == Myvec.mt) then
		error(Myvec._err_table.bad_arg)
	end
	return Myvec.sub(a,b)
end

function Myvec.mt.__unm(a)
	if not (getmetatable(a) == Myvec.mt) then
		error(Myvec._err_table.bad_arg)
	else
		return Myvec.mult_by_scalar(-1,a)
	end
end

function Myvec.mt.__mul(a,b) -- both scalar and v*v
	if type(a) == "number" and getmetatable(b) == Myvec.mt then 
		return Myvec.mult_by_scalar(a,b)
	elseif type(b) == "number" and getmetatable(a) == Myvec.mt then
		return Myvec.mult_by_scalar(b,a)
	elseif getmetatable(a) == Myvec.mt and getmetatable(b) == Myvec.mt then
		return Myvec.mult(a,b)
	else
		error(Myvec._err_table.bad_arg)
	end
end

function Myvec.mt.__div(a,b)
	if type(a) == "number" and getmetatable(b) == Myvec.mt then 
		return Myvec.div_by_scalar(a,b)
	elseif type(b) == "number" and getmetatable(a) == Myvec.mt then
		return Myvec.div_by_scalar(b,a)
	else
		error(Myvec._err_table.bad_arg)
	end
end

function Myvec.mt.__len(a)
	if getmetatable(a) == Myvec.mt then
		return Myvec.euclider_norm(a)
	else
		error(Myvec._err_table.bad_arg)
	end
end

function Myvec.mt.__tostring(a)
	s = "< "..a[1]
	for i = 2, a.n do
		s = s..","..a[i]
	end
	return s.." >"
end

function Myvec.mt.__concat(a,b)
	if type(a) == "string" and getmetatable(b) == Myvec.mt then 
		return a..tostring(b)
	elseif type(b) == "string" and getmetatable(a) == Myvec.mt then
		return tostring(a)..b
	else
		error(Myvec._err_table.bad_arg)
	end
end

function Myvec.mt.__index(v, n)
	if 1 <= n or n <= v.n then
		return nil
	else
		return v[n]
	end
end

function Myvec.mt.__eq(v1,v2)
	if v1.n ~=  v2.n then
		return false end
	for i = 1, v1.n do
		if v1[i] ~= v2[i] then
			return false end
	end
	return true
end
---[[
function Myvec.mt.__shr(v,n)
	i = 1
	r = {n = v.n}
	while(i+n <= v.n) do
		r[i+n] = v[i]
		i = i + 1
	end
	i = 1
	while (i <= n and i <= v.n) do
		r[i] = 0
		i = i + 1
	end
	return Myvec.new(r)
end

function Myvec.mt.__shl(v,n)
	r = {n = v.n}
	i = 1
	while (i+n <= v.n) do
		r[i] = v[i+n]
		i = i + 1
	end
	for i = v.n-n+1, v.n do
		r[i] = 0
	end
	return Myvec.new(r)
end

function next_base_vec(vec)
	if vec == Myvec.new{0,0,0,0} then
		return Myvec.new{1,0,0,0}
	else
		return vec >> 1
	end
end

function iter (vec, i)
	i = next_base_vec(i)
	local val = Myvec.choose(i, vec)
	if val then
		return i, val
	end
end

function Myvec.mt.__ipairs(vec)
	return iter, vec, Myvec.new({0,0,0,0}) 
end

print("module myvec loaded!")

return Myvec
