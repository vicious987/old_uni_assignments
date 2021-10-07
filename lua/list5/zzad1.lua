function chain_iter(tab) 				
	while tab.i < tab.n do 				
		if tab[tab.i+1] == nil then  	
			tab.i = tab.i + 1 			
			tab.j = 0 
		else 
			if tab[tab.i+1][tab.j+1] == nil then 
				tab.i = tab.i + 1 
				tab.j = 0			
			else
				tab.j = tab.j + 1 							
				return tab[tab.i+1][tab.j] 			
			end
		end
	end
	return nil
end

function chain(...)
	t = table.pack(...)
	t.i = 0
	t.j = 0
	return chain_iter, t
end

---[[ przypadek z tresci 
for x in chain({'a', 'b', 'c'}, {40, 50}, {}, {6, 7}) do
	print (x)
end
--]]

--[[ zero argumentow
print ("chain z zerem argumentow - powinno nic nie wypisac")
for x in chain() do
	print (x)
end
print("przed tym nie powinno byc nic")
--]]

--[[ przypadek z nilami wsrod argumentow
for x in chain(nil, {'a', 'b', 'c'},nil,nil,nil, {40, 50}, nil, {}, {6, 7},nil,nil) do
	print (x)
end
--]]

--[[
print("nic nie powinno sie wypisac")
for x in chain({},nil,{},nil,nil,{},{},nil) do
	print (x)
end
print("nic sie nie wypisalo")
--]]
