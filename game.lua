require "player"
require "solidObject"
require "map"
local player = {}
local G = {}

function G.init()
	map = Map()
	player = Player()
	map:addObject(player)
	wall = SolidObject(100,0,100,100)
	map:addObject(wall)
	floor = SolidObject(0,100,200,100,1)
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