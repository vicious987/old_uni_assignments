-- add+, find, merge+, size-#, capacity, pairs, ipairs
Trie = {}
Trie.mt = {}


function head(s)
	return s[1]
end

function tail(s)
    return {select(2, unpack(s))}
end

function singleton(s)
	return 1 == #s
end

function Trie.new(v)
	t = {}
	t.seq = v or {} 
	t.children = {}
	return t
end

function Trie:getseq()
	return self.seq
end

function Trie:addchild(s)
	self.children[#self.children + 1] = Trie.new(s)
end

function printtable(t)




function Trie:add(s)
	if head(self.seq) == head(s) then
		if singleton(self.seq) then
			-- dodaj do tego syna, z ktorym dzielisz glowe.
			for child in self.children do
				if head(child.seq) == head(tail(s)) then
					child:add(tail(s))
				end
				return
			end
			--  jesli takiego nie ma, s jest nowym synem
			self:addchild(tail(s))
		else -- nie jest singletonem
			--rozwin
			t = tail(self.seq)
			self.seq = head(self.seq)
			self:addchild(t)
			--dodaj ogon do syna rozwiniecia
end
	
function pprint(t)
	print(table.concat(t.seq,'-'), "\n")
	for x in t.children do
		pprint(t)
	end
end




print("Trie loaded")
