	------------
	----GAME----
	------------

	exitstr = "Start:\n"
	actions_left, action_limit = 2, 2
	chosen_card = nil

	happened = false
	event_card_on = false
	roll_window_on = false 
	test_passed = false
	rolled = false
	times = 3
	location_now = nil
	location_mystery = nil
	mystery_on = true 
	dices = 1
	roll_table = {}
	att_tested = "none"

	function tab_to_str(tab)
		if #tab == 1 then
			return ""..tab[1]
		end
		if #tab > 1 then
			s=""..tab[1]
			for k = 2, #tab, 1 do
				s = s..", "..tab[k]
			end
			return s
		end
	end

	function endturn()
		actions_left = action_limit
		choose_random_card(location)
		event_card_on = true
	end

	function choose_random_card()
		if location_now == location_mystery and check_mystery_condition() then
			chosen_card = Cards.mystery[math.random(#Cards.mystery)]
		elseif location_now.clue then
			chosen_card = Cards.clue[math.random(#Cards.clue)]
		else
			clt = location_now.location_type
			chosen_card = Cards[clt][math.random(#Cards[clt])]
		end
	end

	function makeithappen()
		happened = not happened
	end

	function check_mystery_condition()
		return pc.clues > 2
	end

	function toggle_event()
		event_card_on = not event_card_on
	end

	function cont_to_roll(att)
		roll_window_on = true 
	end

	function rest()
		if actions_left > 0 then
			pc.hp = pc.hp + 1
			pc.mp = pc.mp + 1
			actions_left = actions_left - 1
		end
	end

	function roll()
		s = 0
		local rolls = {}
		for i = 1, dices, 1 do
			d = math.random(6)
			table.insert(rolls, d)
			if d >= 5 then
				s = s + 1
			end
		end
		rolled = true
		successes = s
		if successes > 1 then
			test_passed = true
		end
		roll_table = rolls
	end


	function exit_rolling()
		roll_window_on = false
		if test_passed then
			chosen_card = chosen_card.eventcard_win
		else
			chosen_card = chosen_card.eventcard_lost
		end
		successes = 0
		roll_table = {}
		dice_to_roll = 0
		test_passed = false
		rolled = false
	end

	function show_mystery()
		mystery_on = true
	end

	function has_val(table, val)
		for i, v in pairs(table) do
			if v == val then
				return true, i
			end
		end
		return false
	end
	Icons = {}
	---------------
	---CHARACTER---
	---------------

	Character = {}
	Character.__index = Character 
	function Character.new(hp, mp, str, agi, int, inf,clues, x, y) 
		local self = setmetatable({}, Character)
		self.__index = self
		self.x = x or 0
		self.y = y or 0
		self.hp = hp or 1 
		self.mp = mp or 2
		self.str = str or 3
		self.agi = agi or 4
		self.int = int or 5
		self.inf = inf or 6
		self.clues = clues or 7
		return self
	end

	function Character:draw()
		seg = 0
		love.graphics.draw(Icons.portrait, self.x, self.y)
		nextatt = self.y + Icons.portrait:getHeight() + seg
		for _, icon in pairs({'hp', 'mp', 'str', 'agi', 'int', 'inf', 'clues'}) do
			love.graphics.draw(Icons.btile, self.x, nextatt)
			love.graphics.draw(Icons[icon], self.x, nextatt)
			love.graphics.draw(Icons.btile, self.x + Icons[icon]:getWidth(), nextatt)
			love.graphics.draw(Icons['square'], self.x + Icons[icon]:getWidth(), nextatt)
			love.graphics.setColor(100, 100, 100)
			txt = self[icon]
			fw, hw = font:getWidth(txt), font:getHeight(txt)
			love.graphics.print(txt, 
								self.x + Icons[icon]:getWidth() + Icons['square']:getWidth()/2 - fw/2, 
								nextatt + Icons['square']:getHeight()/2 - hw/2)
			nextatt = nextatt + Icons[icon]:getHeight() + seg
		end
		txt = "Actions left : "..actions_left
		fw, hw = font:getWidth(txt), font:getHeight(txt)
		love.graphics.print(txt, screen_center_x -fw/2, 0)
	end
	----------------
	---DICE BOARD---
	----------------
	Diceboard = {}
	Diceboard.__index = Diceboard
	function Diceboard.new(diceboardbg, button1, button2)
		local self = setmetatable({}, Diceboard)
		self.bg = diceboardbg
		self.button1 = button1
		self.button2 = button2
		self.rolled = false
		self.successes = -1
		return self
	end

	function Diceboard:draw(att)
		local x, y = screen_center_x - self.bg:getWidth()/2, screen_center_y - self.bg:getHeight()/2
		love.graphics.draw(self.bg, x, y)
		seg = 50
		b1x, b2x = x + seg, x + self.bg:getWidth() - seg - self.button2:getWidth()
		b1y, b2y = y + self.bg:getHeight() - seg - self.button1:getHeight(), y + self.bg:getHeight() - seg - self.button2:getHeight()
		self.button1:set_draw(b1x, b1y)
		self.button2:set_draw(b2x, b2y)
		
		rollstr = tab_to_str(roll_table)
		if rolled then
			love.graphics.print("Rolling for "..att_tested..".You rolled :"..rollstr..".\nThis means "..successes.." successes.", x, y)
		else
			love.graphics.print("No roll yet.", x, y)
		end

	end


	--button : imgobj, imgx, imgy, onclick
	locations = {} -- indexed by vertix number
	buttons = {}
	event_cards = {}

	----------------
	--BUTTON CLASS--
	----------------
	uiButtons = {}
	Button = {}
	Button.__index = Button
	function Button.new(img, img_clicked, x, y, onclick)
		local self = setmetatable({}, Button)
		self.__index = self
		self.img = img or nil
		self.img_clicked = img_clicked or nil
		self.x = x or 0
		self.y = y or 0
		self.w = img:getWidth()
		self.h = img:getHeight()
		self.onclick = onclick or nil
		return self
	end

	function Button:set_img(new_img)
		self.img = new_img
		self.w = img:getWidth()
		self.h = img:getHeight()
	end

	function Button:click()
		self.onclick()
	end

	function Button:set_position(newx, newy)
		self.x = newx or self.x
		self.y = newy or self.y
	end

	function Button:draw()
		love.graphics.draw(self.img, self.x, self.y)
	end

	function Button:set_draw(newx, newy)
		self.x = newx or self.x
		self.y = newy or self.y
		self:draw()
	end

	function Button:getWidth()
		return self.w
	end

	function Button:getHeight()
		return self.h
	end

	function Button:mouseover(mx, my)
		return 	(self.x <= mx and mx <= self.x + self.w) and 
				(self.y <= my and my <= self.y + self.h) 
	end

	function Button:toggle()
		self.img, self.img_clicked = self.img_clicked, self.img
	end

	------------
	--LOCATION--
	------------


	Locations = {}
	Location = {}
	Location.vertix_list = {}
	Location.adj_list = {}
	Location.current = 1
	Location.vertix_no = 0
	Location.__index = Location 

	function Location.new(img1, img2, x, y, connection, clue, location_type, loc_name)
		local self = setmetatable({}, Location)
		self.__index = self
		self.img1 = img1 or nil
		self.img2 = img2 or nil
		self.x = x or 0
		self.y = y or 0
		self.w = img1:getWidth()
		self.h = img1:getHeight()
		self.onclick = Location.moveto
		self.clue = clue or false
		self.location_type = location_type or "city"
		self.name = loc_name or "Default name"

		Location.vertix_no = Location.vertix_no + 1
		self.id = Location.vertix_no

		Location.vertix_list[Location.vertix_no] = Location.vertix_no
		Location.adj_list[Location.vertix_no] = connection
		table.insert(Locations, self)
		return self
	end

	function Location:draw()
		loc_bg = Icons[self.location_type]
		love.graphics.draw(loc_bg, self.x +self.w/2 -loc_bg:getWidth()/2, self.y +self.h/2 - loc_bg:getHeight()/2)
		
		if Location.current == self.id then
			love.graphics.draw(self.img1, self.x, self.y)
		else
			love.graphics.draw(self.img2, self.x, self.y)
		end
		if self.clue then
			love.graphics.draw(Icons['clue'], self.x + self.w, self.y)
		end

	end

	function Location:drawnames()
		love.graphics.print(self.name, self.x + self.w/2 - font:getWidth(self.name)/2, self.y + self.h/2 + 10)
	end

	function Location:drawconnections()
		love.graphics.setColor(0, 0,0,1)
		love.graphics.setLineStyle('smooth')
		love.graphics.setLineWidth(5)
		for _, n in ipairs(Location.adj_list[self.id]) do
			buddy = Locations[n] 
			love.graphics.line(self.x + self.w/2, self.y + self.h/2, buddy.x + buddy.w/2, buddy.y + buddy.h/2)
		end
		love.graphics.setColor(r,g,b,a)
	end

	function Location:moveto()
		if actions_left > 0 and self:reachable() then
			Location.current = self.id
			actions_left = actions_left - 1
			location_now = self
		end
	end

	function Location:reachable()
		for _, vn in ipairs(Location.adj_list[self.id]) do
			if Location.current == vn then
				return true, vn 
			end
		end
		return false
	end

	function Location:mouseover(mx, my)
		return 	(self.x <= mx and mx <= self.x + self.w) and 
				(self.y <= my and my <= self.y + self.h) 
	end

	-------------------
	--EVENTCARD CLASS--
	-------------------
	Cards = {}
	Cards.sea = {}
	Cards.city = {}
	Cards.wilderness = {}
	Cards.mystery = {}

	Eventcard = {}
	Eventcard.__index = Eventcard
	function Eventcard.new(bg, img, text, button)
		local self = setmetatable({}, Eventcard)
		self.__index = self
		self.bg = bg or nil
		self.img = img or nil
		self.text = text
		self.button = button
		return self
	end

	function Eventcard:draw()
		local seg = 50
		local x, y = screen_center_x - self.bg:getWidth()/2, screen_center_y - self.bg:getHeight()/2
		local w = self.bg:getWidth() - 2*seg
		local pic_w, tbox_w, bbox_w = w, w, w
		local pic_h, tbox_h, bbox_h = 250, 150, 75
		local pic_x, tbox_x, bbox_x = x + seg, x + seg, x + seg
		local pic_y, tbox_y, bbox_y = y + seg, y + pic_h + seg + seg/2, y + pic_h + seg + tbox_h + seg 

		love.graphics.draw(self.bg, x, y);
		love.graphics.setColor(1, 0, 0)
		love.graphics.rectangle("line", pic_x, pic_y, pic_w, pic_h)
		love.graphics.setColor(0, 1, 0)
		love.graphics.rectangle("line", tbox_x, tbox_y, tbox_w, tbox_h)
		love.graphics.printf(self.text, tbox_x +10, tbox_y+10, tbox_w - 2*10)
		love.graphics.setColor(0, 0, 1)
		love.graphics.rectangle("line", bbox_x, bbox_y, bbox_w, bbox_h)
		love.graphics.setColor(r, g, b, a)
		self.button:set_draw(screen_center_x - self.button.w / 2, bbox_y)
	end

	function Eventcard:click()
		self.button.onclick()
	end

	local EventcardActive = {}
	EventcardActive = setmetatable({}, {__index = Eventcard})
	EventcardActive.__index = EventcardActive 

	function EventcardActive.new(bg, img, text, button, eventcard_win, eventcard_lost, att_tested)
		local self = setmetatable(Eventcard.new(bg, img, text, button), EventcardActive)
		self.eventcard_win = eventcard_win
		self.eventcard_lost = eventcard_lost
		self.attribute_tested = att_tested or 'str'
		return self
	end

	function EventcardActive:click()
		att_tested = self.attribute_tested
		dices = pc[att_tested]
		self.button.onclick()
	end


	function drawcenter()
		love.graphics.setColor(100, 100,100)
		love.graphics.rectangle("fill", screen_center_x, screen_center_y, 20, 20)
		love.graphics.setColor(r, g, b, a)
	end

	function drawtest(img)
		love.graphics.draw(img, screen_center_x - img:getWidth()/2, love.graphics:getHeight()/2 - img:getHeight() / 2)
	end

	function close_mystery()
		mystery_on = false
	end


	function love.load()
		r,g,b,a = love.graphics.getColor();
		screen_center_x = love.graphics.getWidth() / 2
		screen_center_y = love.graphics.getHeight() / 2
		font = love.graphics.newImageFont("font.png",
			" abcdefghijklmnopqrstuvwxyz" ..
			"ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
			"123456789.,!?-+/():;%&`'*#=[]\"")
		love.graphics.setFont(font)

		background = love.graphics.newImage("mapr.jpg")
		for _, icon in pairs({
			'square', 'portrait', 'hp', 'mp', 'str',
			'agi', 'int', 'inf', 'clues','clue','btile',
			'city', 'sea', 'wilderness'
		}) do
			Icons[icon] = love.graphics.newImage(icon..'.png')
		end

		default_cursor = love.mouse.newCursor("cursor.png", 0, 0)
		love.mouse.setCursor(default_cursor)
		

		pc = Character.new()

		ok_button = love.graphics.newImage("ok.png")
		ok_button_pressed = love.graphics.newImage("ok_pressed.png")
		cont_button = love.graphics.newImage("cont.png")
		cont_button_pressed = love.graphics.newImage("cont_pressed.png")
		rest_button = love.graphics.newImage("rest.png")
		showmystery_button = love.graphics.newImage("showmystery.png")
		endturn_button = love.graphics.newImage("endturn.png")

		a = love.graphics.getWidth() - ok_button:getWidth()
		b = ok_button:getHeight()
		b1 = Button.new(showmystery_button, ok_button_pressed, a, b, show_mystery)
		b2 = Button.new(rest_button, ok_button_pressed, a, 2*b, rest, ok_button_pressed)
		b3 = Button.new(endturn_button, ok_button_pressed, a, 3*b, endturn, ok_button_pressed)
		eventbutton = Button.new(ok_button, ok_button_pressed, nil, nil, toggle_event)
		rollbutton = Button.new(ok_button, ok_button_pressed, nil, nil, roll)
		mystery_cont_button = Button.new(cont_button, cont_button_pressed, nil, nil, close_mystery)
		exitrollbutton = Button.new(cont_button, cont_button_pressed, nil, nil, exit_rolling)
		ontorollbutton = Button.new(cont_button, cont_button_pressed, nil, nil, cont_to_roll)
		uiButtons = {b1,b2,b3}
		
		cardbg = love.graphics.newImage("cardbg.png")
		Mystery = Eventcard.new(cardbg, nil, "Mystery Description and Mystery requirements\nIn other words, Mystery is an end goal of the game.", mystery_cont_button)
		ec1 = Eventcard.new(cardbg, nil, "card 1 text (city)", eventbutton)
		ec2 = Eventcard.new(cardbg, nil, "card 2 text (sea)", eventbutton)
		ec3 = Eventcard.new(cardbg, nil, "card 3 text (wilderness)", eventbutton)
		ec4 = Eventcard.new(cardbg, nil, "card 4 text (clue)", eventbutton)
		ecl = Eventcard.new(cardbg, nil, "This is aftermath of an event - fail", eventbutton)
		ecw = Eventcard.new(cardbg, nil, "This is aftermath of an event - success", eventbutton)
		ecastr = EventcardActive.new(	cardbg, nil, "this is active event which is testing your character's  strength", 
									ontorollbutton, ecw, ecl,"str")
		ecaagi = EventcardActive.new(	cardbg, nil, "this is active event which is testing your character's agility", 
									ontorollbutton, ecw, ecl,"agi")
		ecaint = EventcardActive.new(	cardbg, nil, "this is active event which is testing your character's inteligence", 
									ontorollbutton, ecw, ecl,"int")
		ecainf = EventcardActive.new(	cardbg, nil, "this is active event which is testing your character's influence", 
									ontorollbutton, ecw, ecl, "inf")

		Cards.city = {ec1, ecainf}
		Cards.sea = {ec2, ecastr}
		Cards.wilderness = {ec3, ecaagi}
		Cards.clue =  {ec4, ecaint}
		Cards.mystery = {eca1, eca2}

		loc_img2 = love.graphics.newImage("black.png")
		loc_img1 = love.graphics.newImage("red.png")
		c = "city"
		w = "wilderness"
		s = "sea"

		l1 = Location.new(loc_img1, loc_img2, 247, 364, {2,3,10},false, c)
		l2 = Location.new(loc_img1, loc_img2, 344, 204, {1},false, w)
		l3 = Location.new(loc_img1, loc_img2, 300, 398, {1,4},false, s)
		l4 = Location.new(loc_img1, loc_img2, 288, 455, {3,5},true, c)
		l5 = Location.new(loc_img1, loc_img2, 264, 660, {4,6},false, c)
		l6 = Location.new(loc_img1, loc_img2, 421, 625, {5,7},false, s)
		l7 = Location.new(loc_img1, loc_img2, 530, 582, {6,8},true, c)
		l8 = Location.new(loc_img1, loc_img2, 521, 444, {7,9},false, w)
		l9 = Location.new(loc_img1, loc_img2, 501, 353, {8,10},true, c)
		l10 = Location.new(loc_img1, loc_img2, 463, 309, {1,9},false, c)
		location_now = l1
		--Locations = {l1,l2,l3,l4}

		diceboardbg = love.graphics.newImage("diceboardbg.png")
		db = Diceboard.new(diceboardbg, rollbutton, exitrollbutton)
		


		--it = love.graphics.newImage("img2.jpg")
	end


	function love.draw()
		love.graphics.draw(background, love.graphics:getWidth() / 2 - background:getWidth()/2, love.graphics:getHeight() / 2 - background:getHeight() / 2)


		love.graphics.setLineStyle("smooth")
		love.graphics.setLineWidth(10)
		--love.graphics.line(st)
		--
		for _, l in ipairs(Locations) do
			l:drawconnections()
		end
		for _, l in ipairs(Locations) do
			l:draw()
		end
		for _, l in ipairs(Locations) do
			l:drawnames()
		end

		for _, b in ipairs(uiButtons) do
			b:draw()
		end
		if event_card_on then 
			chosen_card:draw() 
		end
		if roll_window_on then
			db:draw()
		end

		if happened then
			drawtest(it)
		end
		
		if mystery_on then
			Mystery:draw()
		end
	--	drawcenter()
		pc:draw()
	end

	function love.mousereleased(x, y, button)
		local mx, my = love.mouse.getPosition()
		if button == 1 then

			if mystery_on then
				if Mystery.button:mouseover(mx, my) then
					Mystery.button.onclick()
					Mystery.button:toggle()
				end
			end

			if event_card_on then
				if chosen_card.button:mouseover(mx, my) then
					chosen_card:click()
					chosen_card.button:toggle()
				end
			end

			if roll_window_on then
				emx, emy = mx, my
				if db.button1:mouseover(mx, my) then
					db.button1.onclick()
					db.button1:toggle()
				elseif db.button2:mouseover(mx, my) then
					db.button2.onclick()
					db.button2:toggle()
				end
			end

			for _, b in ipairs(uiButtons) do
				if b:mouseover(mx, my) then
					b.onclick()
					b:toggle()
				end
			end

			for _, l in ipairs(Locations) do
				if l:mouseover(mx, my) then 
					l.onclick(l)
				end
			end
		end
	end

	function love.mousepressed(x, y, button)
		local mx, my = love.mouse.getPosition()
		if button == 1 then

			if mystery_on then
				if Mystery.button:mouseover(mx, my) then
					Mystery.button:toggle()

				end
			end

			if event_card_on then
				if chosen_card.button:mouseover(mx, my) then
					chosen_card.button:toggle()
				end
			end

			if roll_window_on then
				emx, emy = mx, my
				if db.button1:mouseover(mx, my) then
					db.button1:toggle()
				elseif db.button2:mouseover(mx, my) then
					db.button2:toggle()
				end
			end

			for _, b in ipairs(uiButtons) do
				if b:mouseover(mx, my) then
					b:toggle()
				end
			end
		end
	end

	function love.keypressed(key)
		if key == "space" then
			endturn()
			--endturn()
		elseif key == "e" then
			event_card_on = true
		elseif key == "q" then
			event_card_on = false
		end
	end

	function bs(b)
		if b then
			return 'true'
		else
			return 'false'
		end
	end

	function love.quit()
		exitstr = exitstr..":End"
	end
