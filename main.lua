local Game = require "game"
local Paused = require "paused"
local Menu = require "menu"
local Gamestate = ""


function love.load()
	Gamestate = "game"
	Game.init()
	Paused.init()
	Menu.init()
end

function love.update(dt)
	local current = Gamestate
	if Gamestate == "game" then
		Gamestate = Game.update(dt) or Gamestate
	elseif Gamestate == "menu" then
		Gamestate = Menu.update(dt) or Gamestate
	elseif Gamestate == "paused" then
		Gamestate = Paused.update(dt) or Gamestate
	end
	if current ~= Gamestate then
		switch(Gamestate, current)
	end
end

function love.draw()
	if Gamestate == "game" then
		Game.draw()
	elseif Gamestate == "menu" then
		Menu.draw()
	elseif Gamestate == "paused" then
		Game.draw()
		Paused.draw()
	end
end

function love.keypressed(key)
	local current = Gamestate
	if Gamestate == "game" then
		Gamestate = Game.keypressed(key) or Gamestate
	elseif Gamestate == "menu" then
		Gamestate = Menu.keypressed(key) or Gamestate
	elseif Gamestate == "paused" then
		Gamestate = Paused.keypressed(key) or Gamestate
	end
	if current ~= Gamestate then
		switch(Gamestate, current)
	end
end

function switch(to, from)
	if to == "menu" then
		Menu.start(from)
	elseif to == "paused" then
	    Paused.start(from)
	else
	    Game.start(from)
	end
end