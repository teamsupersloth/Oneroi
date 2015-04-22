local P = {}

function P.init()

end

function P.update(dt)

end

function P.draw()
	love.graphics.print("Paused", 100, 200)
end

function P.keypressed(key)
	if(key == "escape") then
			return "game"
		end
end

function P.start(from)

end



return P