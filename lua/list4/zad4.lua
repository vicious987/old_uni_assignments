--[[Zadanie 4.
(3p) Zaprojektuj kalendarz przechowujący zdarzenia których czas startu i końca ma typ date. Napisz funkcję
add (calendar, event) która dodaje wydarzenie do kalendarza i zwraca wskaźnik na to wydarzenie w 
kalendarzu jeśli operacja się powiedzie lub nil i wskaźnik na wydarzenie kolidujące w przeciwnym przypadku.
Napisz funkcję show (calendar [, all])która wypisuje wydarzenia z kalendarza w porządku
rosnącym, domyslnie od aktualnej chwili, chyba, że argument all jest prawdą, wtedy wypisz cały kalendarz.
]]--

-- event - {name, start = date_start, finish = date_finish}
cal= {}
function add(calendar, event)
	for k,v in pairs(cal) do
		if event.name == v.name then
			return nil, v
		elseif v.start <= event.start and event.start <= v.finish then --new event starts during existing one!
			return nil, v
		elseif v.start <= event.finish and event.finish <= v.finish then --new event ends during existing one!
			return nil, v
		elseif event.start <= v.start and event.finish >= v.finish then --there is already an event during new event!
			return nil, v
		end
	end
	calendar[event.start] = {start = event.start, finish = event.finish, name = event.name}
	return calendar[event.start]
end

function show_event(event)
	if event == nil then
		print("the event is empty!")
		return
	end
	st = os.date('%d/%m/%Y, %A, %H:%M', event.start)
	fin = os.date('%d/%m/%Y, %A, %H:%M', event.finish)
	print(event.name,"starts at:", st,"ends at:", fin)
end

function show(calendar, all)	
	if all == nil then current_time = os.time() else current_time = 0 end
	ordered_keys = {}
	for k,_ in pairs(calendar) do
		table.insert(ordered_keys, k)
	end
	table.sort(ordered_keys)
	for i = 1, #ordered_keys do
		if ordered_keys[i] > current_time then -- !
			show_event(calendar[ordered_keys[i]])
		end
	end
end

function to_event(	sy,sm,sd,sh,smin,
					fy,fm,fd,fh,fmin,N)
	return {name = N, 
		 start = os.time{year = sy, month = sm, day = sd, hour = sh, min = smin, },
		finish = os.time{year = fy, month = fm, day = fd, hour = fh, min = fmin, }
	}
end

add(cal, to_event(	2020,6,14,6,30,
			2020,6,14,7,10,
			"test1"))
add(cal, to_event(	2000,6,14,10,00,
			2000,6,14,12,45,
			"test2"))
add(cal, to_event(	2000,6,14,20,15,
			2000,6,14,21,10,
			"test3"))
add(cal, to_event(	2000,6,4,1,30,
			2000,6,4,2,30,
			"test4"))

_, a = add(cal, to_event(	2000,6,14,6,40,
				2000,6,14,8,00,
				"test5"))

_, b = add(cal, to_event(	2000,6,14,9,30,
				2000,6,14,10,30,
				"test6"))

_, c = add(cal, to_event(	2000,6,4,0,30,
				2000,6,4,3,30,
				"test7"))


show(cal)
print("\nthe colliding ones")
print("with test5: ")
show_event(a)
print("with test6: ")
show_event(b)
print("with test7: ")
show_event(c)


