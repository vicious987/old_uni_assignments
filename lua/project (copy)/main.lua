s_id = 0
action_limit = 2
actions_left = action_limit

screen_center_x = nil
screen_center_y = nil
chosen_card = nil
chosen_card_button_area = {}
ccba = {}

event_card_on = false


function has_val(table, val)
	for i, v in pairs(table) do
		if v == val then
			return true, i
		end
	end
	return false
end

function newid()
	s_id = s_id + 1
	return s_id
end

ver_lst = {1,2,3,4}
adj_lst = { 
	{2, 3},
	{1, 4},
	{1, 4},
	{2, 3}
}
starting_ver = 1

--button : imgobj, imgx, imgy, onclick
locations = {} -- indexed by vertix number
buttons = {}
event_cards = {}

function add_button(states, frame, x, y, w, h, current_state)
	table.insert(buttons, {id = newid, states = states, frame = frame, x = x, y = y, h = h, w = w, current_state = current_state})
end

function add_location(vid, marker, x, y, w, h, active)
	table.insert(locations, {vid = vid, marker = marker, x = x, y = y, h = h, w = w, active = active})
end

function make_eventcard(bg, text, x, y, butt, onclick)
	return {bg = bg, text = text, x = x, y = y, butt = butt, onclick = onclick}
end

function add_eventcard(bg, text, x, y, butt)
	return table.insert(event_cards, make_eventcard(bg, text, x ,y, butt))
end


function draw_location(l)
	love.graphics.draw(l.marker, l.x, l.y)
	if l.active then
		love.graphics.draw(location_active, l.x, l.y)
	end
end


function reachable_location(l)
	for i, v in ipairs(adj_lst[l.vid])do
		if locations[v].active == true then
			return true, locations[v] 
		end
	end
	return false
end


function moveto_location(from, to)
	from.active = false
	to.active = true
	actions_left = actions_left - 1
end


function draw_button(b)
	love.graphics.draw(b.states[b.current_state], b.x, b.y)
	love.graphics.draw(b.frame, b.x, b.y)
end


function draw_event(c)
	--card_buttons = {1,2}
	card_buttons = c.btab 
	x, y = screen_center_x - c.bg:getWidth()/2, screen_center_y - c.bg:getHeight()/2
	pic_w, pic_h = 500, 250
	tbox_w, tbox_h = 500, 150 
	bbox_w, bbox_h = 500, 75
	
	seg = 50
	pic_x = x + seg 
	pic_y = y + seg 

	tbox_x = x + seg
	tbox_y = y + pic_h + seg + seg/2

	bbox_x = x + seg
	bbox_y = y + pic_h + seg + tbox_h + seg 

	button_y = bbox_y
	button_x = screen_center_x - c.butt:getWidth()/2

	love.graphics.draw(c.bg, x, y);

	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("line", pic_x, pic_y, pic_w, pic_h)

	love.graphics.setColor(0, 1, 0)
	love.graphics.rectangle("line", tbox_x, tbox_y, tbox_w, tbox_h)

	tbox_off = 20
	love.graphics.printf(c.text, tbox_x +10, tbox_y+10, tbox_w - 2*10)


	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle("line", bbox_x, bbox_y, bbox_w, bbox_h)

	love.graphics.setColor(r, g, b, a)
	love.graphics.draw(c.butt, button_x, button_y)
	chosen_card_button_area = {button_x, button_y, c.butt:getWidth(), c.butt:getHeight()}
	ccba = {button_x, button_y, c.butt:getWidth(), c.butt:getHeight()}
end


function within_area(point_x, point_y, area_start_x, area_start_y, area_width, area_height)
	return (area_start_x <= point_x and point_x <= area_start_x + area_width) and area_start_y <= point_y and point_y <= area_start_y + area_height
end


function cycle_state(b)
	b.current_state = b.current_state + 1
	b.current_state = ((b.current_state + 1) % #b.states) + 1
end


function endturn()
	actions_left = action_limit
end


function drawcenter()
	love.graphics.setColor(100, 100,100)
	love.graphics.rectangle("fill", screen_center_x, screen_center_y, 20, 20)
	love.graphics.setColor(r, g, b, a)
end

function drawtest(img)
	love.graphics.draw(img, screen_center_x - img:getWidth()/2, love.graphics:getHeight()/2 - img:getHeight() / 2)
end

function choose_random_card()
	chosen_card = event_cards[math.random(#event_cards)]
end

function love.load()
	r,g,b,a = love.graphics.getColor();
	screen_center_x = love.graphics.getWidth() / 2
	screen_center_y = love.graphics.getHeight() / 2

	sound = love.audio.newSource("song.mp3", "stream")

	default_cursor = love.mouse.newCursor("cursor.png", 0, 0)

	background = love.graphics.newImage("mapr.jpg")
	button_fill_black = love.graphics.newImage("black.png")
	button_fill_red = love.graphics.newImage("red.png")
	button_states = {button_fill_black, button_fill_red}	
	button_frame = love.graphics.newImage("ring.png")
	
	location_marker = love.graphics.newImage("marker.png")
	location_active = love.graphics.newImage("active.png")

    love.mouse.setCursor(default_cursor)
	add_button(button_states, button_frame, 100, 100, 24, 24, 1)
	add_button(button_states, button_frame, 200, 100, 24, 24, 1)
	add_button(button_states, button_frame, 300, 100, 24, 24, 1)
	add_button(button_states, button_frame, 400, 100, 24, 24, 1)
	add_location(1, location_marker, 200, 200, 30, 30, true)
	add_location(2, location_marker, 200, 400, 30, 30, false)
	add_location(3, location_marker, 400, 200, 30, 30, false)
	add_location(4, location_marker, 400, 400, 30, 30, false)
	--love.audio.play(sound)
	ok_button = love.graphics.newImage("ok.png")
	
	cardbg = love.graphics.newImage("windowbg.png")
	w, h = cardbg:getWidth()/2, cardbg:getHeight()/2

	event_card_1 = add_eventcard(cardbg, "card 1 text", screen_center_x - w, screen_center_x - h, ok_button)
	event_card_2 = add_eventcard(cardbg, "card 2 text", screen_center_x - w, screen_center_x - h, ok_button)
	event_card_3 = add_eventcard(cardbg, "card 3 text", screen_center_x - w, screen_center_x - h, ok_button)


	it = love.graphics.newImage("img2.jpg")
	chosen_card = event_cards[1]

end


function love.draw()
	love.graphics.draw(background, love.graphics:getWidth() / 2 - background:getWidth()/2, love.graphics:getHeight() / 2 - background:getHeight() / 2)
 
	for _, v in ipairs(buttons) do
		draw_button(v)
	end
	for _, v in ipairs(locations) do
		draw_location(v)
	end
	if event_card_on == true then
		draw_event(chosen_card)
	end
	--drawtest(it)
	drawcenter()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		if event_card_on == false then
			for _, b in ipairs(buttons) do
				if within_area(x, y, b.x, b.y, b.w, b.h) then 
					cycle_state(b)
				end
			end

			for _, l in ipairs(locations) do
				if within_area(x, y, l.x, l.y, l.w, l.h) then 
					reachable, from = reachable_location(l)
					if reachable and actions_left > 0 then
						moveto_location(from, l)
					end
				end
			end
		else
			if passive_event == true then
				sx,sy,aw,ah = ccba[1],ccba[2],ccba[3],ccba[4]
				if within_area(x,y, sx, sy, aw,ah) then
					event_card_on = false
				end
			else

			end
		end
	end
end


function love.keypressed(key)
    if key == "space" then
		choose_random_card()
		endturn()
	elseif key == "e" then
		event_card_on = true
	elseif key == "q" then
		event_card_on = false
	end
end

function love.quit()
	print("Done")
end
