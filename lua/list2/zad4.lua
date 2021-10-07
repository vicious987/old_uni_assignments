task_calendar = {}
function add_task(new_label, new_start, new_end, new_name)
	if task_calendar[new_label] == nil then 
		task_calendar[new_label] = {}
		table.insert(task_calendar[new_label], {name = new_name, start_hour = new_start, end_hour = new_end})
		return true
	else
		for _, v in pairs(task_calendar[new_label]) do
			if v[name] == new_name then
				return false, "such event on this day already exists!"
			elseif v["start_hour"] <= new_start and new_start <= v["end_hour"] then   
				return false, "conflicting times! new event starts during existing one!"
			elseif v["start_hour"] <= new_start and new_end <= v["end_hour"] then
				return false, "conflicting times! new event ends during existing one!"
			elseif new_start >= v["start_hour"] and new_end <= v["end_hour"] then
				return false, "conflicting times! there is already an event during new event!"
			end
			table.insert(task_calendar[new_label], {name = new_name, start_hour = new_start, end_hour = new_end})
			return true
		end
	end
end

function display_tasks_on(day)
	if task_calendar[day] == nil then 
		print("nothing to do on that day")
	else	
		print(day)
		for _, v in pairs(task_calendar[day]) do
			print(v["start_hour"], v["end_hour"], v["name"])
		end
	end
end

function display_all()
	for k, _ in pairs(task_calendar) do
		display_tasks_on(k)
	end
end


add_task("monday",13,18,"derping around p1")
add_task("monday",10,12,"herping around")
b, str = add_task("monday",15,16,"not supposed to be here")
add_task("doomsday",16,18,"derping around p2")
display_all()
--display_tasks_on("monday")
--print(b, str)
