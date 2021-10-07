utf8.reverse = function (str)
	r = ""
	for i,c in utf8.codes(str) do
		r = utf8.char(c)..r
	end
	return r

end

print(utf8.reverse("KŚi ĘżYĆ"))
