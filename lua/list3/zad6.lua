function lreverser(source, target)
	--input_file = io.stdin
	--output_file = io.stdout
	if source then 
		input_file = io.open(source, "r") 
	else
		input_file = io.stdin
	end
	if target then 
		file = io.open(target,"r")
		if file then
			local answer
			repeat
				print("file with given name already exists - do want to overwrite it ? (y/n)")
				answer = io.read()
			until answer == "y" or answer == "n"
			if answer == "n" then return end
		end
		output_file = io.open(target,"w") 
	else
		output_file = io.stdout
	end

	---[[
	for line in input_file:lines() do
		list = {next = list, value = line.."\n"}
	end

	
	while list do
		output_file:write(list.value)
		list = list.next
	end
	output_file:close()
	--]]
end

--lreverser("t1.txt","o3.txt") -- o3 nie istnieje
--lreverser("t1.txt","o1.txt") -- o1 istnieje
--lreverser("t1.txt") -- na std out
lreverser() -- z std in, na std out
