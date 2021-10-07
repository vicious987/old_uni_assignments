--[[
Zadanie 1.
(3p)  Napisz  bezstanowy  iterator chain,  działający  jak  pythonowy  itertools.chain.  Iterator przyjmuje dowolną liczbę argumentów 
będących sekwencjami.

for x in  chain({’a’, ’b’, ’c’}, {40, 50}, {}, {6, 7}) do
print (x)
end
--> a \n b \n c \n 40 \n 50 \n 6 \n 7
--]]

--stateless use only control var and invariant state
--seedless use only mutable value as state, so it doesnt need control var/seed
---[[

function chain_iter(tab) 				-- zaczynamy od i = 0, czyli przed pierwszym elementem tablicy
	while tab.i < tab.n do 				-- dopoki mamy jeszcze elementy w tablicy
		if tab[tab.i+1] == nil then  	-- jesli kolejny jest nilem
			tab.i = tab.i + 1 			-- przejdzmy do nastepnego
			tab.j = 0 					-- reset iteracji w elementach tablicy, bo przechodzimy do nastepnego
		else 
			if tab[tab.i+1][tab.j+1] == nil then 	-- jesli nastepny jest nilem, to przeszlismy w calym elemencie
				tab.i = tab.i + 1 					-- wiec przechodzimy do kolejnego
				tab.j = 0							-- resetujac iteracje w elementach
			else
				tab.j = tab.j + 1 				--WPP
				return tab[tab.i+1][tab.j]  	--zwracamy i przechodzimy na kolejny w tym elemencie
			end
		end
		--iteruj po e1 tablicy
		--jestli iterowany elemement z e1 jest nilem, przejdz iteruj po elementach e2
	end
	return nil
end

function chain(...)
	t = table.pack(...)
	t.i = 0
	t.j = 0
	return chain_iter, t
end

--[[ przypadek z tresci 
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
