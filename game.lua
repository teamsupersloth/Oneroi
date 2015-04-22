require "player"
require "solidObject"
require "map"
local player = {}
local G = {}

function G.init()
	map = Map()
	player = Player:new()
	wall = SolidObject:new(100,0,100,100)
	map:addObject(player)
	map:addObject(wall)
end

function G.update(dt)
	map:update(dt)
end

function G.draw()
	map:draw()
end

function G.keypressed(key)
	if(key == "escape") then
		return "paused"
	end
end

function G.start(from)

end

return G