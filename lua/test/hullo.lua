print ("hullo")

--print(_VERSION)

C = {}
C.comm = 15

C.__index = C-- failed table lookups on the instances should fallback to the class table, to get methods
function C.new(v)
	local self = setmetatable({}, C)
	self.__index = self
	self.val = v 
	return self
end

function C:get()
	return self.val
end

function C:gett()
	return self.val + C.comm
end

ci = C.new(10)
print(ci:get())
print(ci:gett())
