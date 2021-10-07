p1 = [[K:/hidden -name/Te.aching /2016 _Lua/[Lab]/ Lecture  04..pdf]]
p2 = [[c:\temp\test\myfile.txt]]
p3 = [[c:/temp/test/myfile.txt]]
p4 = [[de*rpa(her.ascd23 a va .derp]]

function unpath(path)
	d = package.config:sub(1,1)
	directory_pattern = "[^"..d.."]+"	
	-- dopełnienie unii znaków złożonych z '/'
	-- + zlapie conajmniej 1 znak
	file_pattern= "(.-)%.([^%.]+)$"
	t = {}
	for x in string.gmatch(path, directory_pattern) do
		t[#t+1] = x 
	end
	n, e = string.match(t[#t], file_pattern)
	t[#t] = {name = n, extension = e}
	return t
end

res = unpath(p1)
for k,v in pairs(res) do
	print(k,v)
end
print(res[#res].name, res[#res].extension)




