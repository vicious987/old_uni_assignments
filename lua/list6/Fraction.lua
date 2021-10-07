-- Fraction modulesub
--[[
Klasa  powinna  być inicjalizowana  dwiema  liczbami  całkowitymi  i  obsługiwać  
operacje  arytmetyczne  (dodawanie,  odejmowanie,  unarny  minus,  mnożenie,  dzielenie)  pomiędzy  dwoma  ułamkami;  
wszystkie  operacje  boolowskie; metodę tostring oraz konkatenację z napisami (na wzór typu number). 
Zadbaj o to, aby ułamki zawsze były trzymane w skróconej formie. 
Klasa powinna także udostępniać funkcję konwertującą ułamek na liczbę.
Dodaj prawidłową obsługę operacji arytmetycznych jeśli jednym z argumentów będzie nie ułamek lecz liczba 
(całkowita lub zmiennoprzecinkowa), zastanów się nad zwracanym rezultatem. 
Dodaj obsługę operacji potęgowania jeśli drugim argumentem jest liczba całkowita 
(w przeciwnym wypadku operator powinien zgłosić błąd)
--]]
Fraction = {} 
Fraction.mt = {}

-- Fraction methods 
-- new-, add-, sub-, mult-, div-, inverse-, pow-, point_notation-
--

Fraction._err_table = {}
Fraction._err_table.invalid_denom = "Fraction does not allow 0 in denominator"
Fraction._err_table.invalid_args_arth = "Fraction arithmetic functions expects only number and fraction, or fraction and fraction"
Fraction._err_table.invalid_args_pow = "Fraction.pow expects only Fraction, integer as first, second argument"
Fraction._err_table.invalid_args_concat= "Fraction concat expects only strings"
Fraction._err_table.invalid_args_numbertofrac = "Fraction numbertofraction expects integer or float as argument"

function gcd(a, b)
	if b ~= 0 then
		return gcd(b, a % b)
	else
		return math.abs(a)
	end
end

function Fraction.new(a, b)
	if (b == 0) then
		error(Fraction._err_table.invalid_denom)
	end
	r = {nom = a / gcd(a, b), denom = b / gcd(a, b)}
	setmetatable(r, Fraction.mt)
	return r
end

function Fraction.floattofrac(n)
	i, f = math.modf(n)
	fstr = tostring(f)
	exp = #fstr - 2
	nomf = tonumber(fstr:sub(3))
	nomi = i * 10 ^ exp
	return Fraction.new(nomf + nomi, 10 ^ exp)
end

function Fraction.numbertofrac(n) -- a helper function
	if math.type(n) == "integer" then
		return Fraction.new(n, 1)
	elseif math.type(n) == "float" then
		return Fraction.floattofrac(n)
	end
end

-- checks the types, works on arguments and then calls function f on changed args
function Fraction.arithmetic_helper(a, b, fun, err_msg) 	
	if type(a) == "number" and getmetatable(b) == Fraction.mt then
		return fun(Fraction.numbertofrac(a), b) 
	elseif type(b) == "number" and getmetatable(a) == Fraction.mt then 
		return fun(a, Fraction.numbertofrac(b))
	elseif getmetatable(a) == Fraction.mt and getmetatable(b) == Fraction.mt then 
		return fun(a,b)
	else
		if err_msg then
			error(err_msg)
		else
			error(Fraction._err_table.invalid_args_arth)
		end
	end
end

function Fraction.add(arg1, arg2) 
	return Fraction.arithmetic_helper(arg1, arg2, function (f1,f2) return Fraction.new(f1.nom * f2.denom + f2.nom * f1.denom, f1.denom * f2.denom) end)
end

function Fraction.sub(arg1, arg2)	
	return Fraction.arithmetic_helper(arg1, arg2, function (f1,f2) return Fraction.new(f1.nom * f2.denom - f2.nom * f1.denon, f1.denom * f2.denom) end)
end

function Fraction.mult(arg1, arg2)
	return Fraction.arithmetic_helper(arg1, arg2, function (f1, f2) return Fraction.new(f1.nom * f2.nom, f1.denom * f2.denom) end)
end

function Fraction.div(arg1, arg2)
	return Fraction.arithmetic_helper(arg1, arg2, function (f1, f2) return Fraction.mult(f1, Fraction.inverse(f2)) end)
end

function Fraction.pow(f, exp)
	if getmetatable(f) == Fraction.mt and math.type(exp) == "integer" then
		return Fraction.new(math.pow(f.nom, exp), math.pow(f.denom, exp))
	else
		error(Fraction._err_table.invalid_args_pow)
	end
end

function Fraction.point_notation(f)
	return f.nom / f.denom
end



-- fraction methamethods

function Fraction.mt.__eq(f1, f2)
	return f1.nom == f2.nom and f2.nom == f2.nom
end

function Fraction.mt.__lt(f1, f2)
	return f1.nom * f2.denom < f2.nom * f1.denom
end

function Fraction.mt.__le(f1, f2)
	return Fraction.eq(f1,f2) or Fraction.le(f1,f2)
end

function Fraction.mt.__unm(f)
	return Fraction.new(-f.nom, f.denom) 
end

function Fraction.mt.__tostring(f)
	return math.floor(f.nom) .. " : " .. math.floor(f.denom)
end

function Fraction.mt.__concat(a, b)
	if type(a) == "string" and getmetatable(b) == Fraction.mt then
		return a..tostring(b)
	elseif type(b) == "string" and getmetatable(a) == Fraction.mt then 
		return tostring(a)..b
	else
		error(Fraction._err_table.invalid_args_concat)
	end
end

function Fraction.mt.__add(a,b)
	return Fraction.add(a,b)
end

function Fraction.mt.__sub(a,b)
	return Fraction.sub(a,b)
end

function Fraction.mt.__mul(a,b)
	return Fraction.mult(a,b)
end

function Fraction.mt.__div(a,b)
	return Fraction.mult(a,b)
end

function Fraction.mt.__pow(a,b)
	return Fraction.pow(a,b)
end
--]]
print("fraction module loaded!")
return Fraction
