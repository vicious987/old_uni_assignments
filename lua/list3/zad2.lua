function normalize(str)
	r = ""
	for i,c in utf8.codes(str) do
		if c <= 127 then
			r = r..utf8.char(c)
		end
	end
	return r
end

print(normalize("blaπœęą!?.,;'[]<>{}`| bleśźźżćæœbli"))
print(normalize("blabli"))
