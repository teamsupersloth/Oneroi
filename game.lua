require "player"
require "solidObject"
require "map"
local player = {}
local G = {}

function G.init()
	map = Map()
	player = Player:new()
	wall = SolidObject:new(100,0,100,100)
	floor = SolidObject:new(0,100,200,100,1)
	map:addObject(player)
	map:addObject(wall)
	map:addObject(floor)
end

function G.update(dt)
	map:update(dt)
end

function G.draw()
	map:draw()
	fps = love.timer.getFPS()
	love.graphics.print("FPS: " .. tostring(fps), 710, 10)
end

function G.keypressed(key)
	if(key == "escape") then
		return "paused"
	end
end

function G.start(from)

end

return G