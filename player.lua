require "class"
require "object"
Player = class(Object,
	function(plr,x,y,w,h,speed,map,depth)
		Object.new(plr,map,false,true,depth)
		plr.x = x or 0
		plr.y = y or 0
		plr.w = w or 20
		plr.h = h or 20
		plr.speed = speed or 100
		return plr
	end)

function Player:draw()
	love.graphics.setColor(0, 255, 255, 255)
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function Player:update(dt)
	local dx = 0
	local dy = 0
	if(love.keyboard.isDown("a")) then
		dx = dx - self.speed * dt
	end
	if(love.keyboard.isDown("d")) then
		dx = dx + self.speed * dt
	end
	local i = 1
	if(dx > 0) then i = -1 end
	for x = dx,0,i do
		if(self:checkFree(dx,0)) then
			self.x = self.x + x
			break
		end
	end
	local i = 1
	if(dy > 0) then i = -1 end
	for y = dy,0,i do
		if(self:checkFree(0,dy)) then
			self.y = self.y + y
			break
		end
	end
end

function Player:checkFree(dx,dy)
	return self.map:placeFree(self.x + dx,self.y + dy) and 
		   self.map:placeFree(self.x + self.w + dx,self.y + dy) and
		   self.map:placeFree(self.x + dx,self.y + self.h + dy) and
		   self.map:placeFree(self.x + self.w + dx,self.y + self.h + dy)
end