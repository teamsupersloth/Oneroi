require "player"
require "map"
local player = {}
local G = {}

function G.init()
	map = Map()
	player = Player()
	map:addObject(player)
end

function G.update(dt)
	map:update(dt)
end

function G.draw()
	map:draw()
end

function G.keypressed(key)

end

function G.start(from)

end

return G