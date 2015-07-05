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
		plr.grav = 0
		return plr
	end)

function Player:draw()
	love.graphics.setColor(0, 255, 255, 255)
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
	love.graphics.print(tostring(self.grav), 100,10)
end

function Player:update(dt)
	local dx = 0
	local dy = 0

	--Horizontal movement
	if(love.keyboard.isDown("a")) then
		dx = dx - self.speed * dt
	end
	if(love.keyboard.isDown("d")) then
		dx = dx + self.speed * dt
	end
	
	--Gravity movement
	if(self:checkFree(0,1)) then
		dy = dy + self.grav
		self.grav = self.grav + 20*dt
	else 
		self.grav = 0
		if(love.keyboard.isDown("w")) then
			self.grav = -7
			dy = -7*dt
		end
	end

	--Account for rounding errors
	dx = round(dx)
	dy = round(dy)

	--Resolve Collisions and Movement
	if(math.abs(dx) > 0) then
		local i = 1
		if(dx > 0) then i = -1 end
		for x = dx,0,i do
			if(self:checkFree(x,0)) then
				self.x = self.x + x
				break
			end
		end
	end
	if(math.abs(dy) > 0) then
		local i = 1
		if(dy > 0) then i = -1 end
		for y = dy,0,i do
			if(self:checkFree(0,y)) then
				self.y = self.y + y
				break
			end
		end
	end
end

function Player:checkFree(dx,dy)
	return self.map:placeFree(self.x + dx, self.y + dy) and 
		   self.map:placeFree(self.x + (self.w-1) + dx, self.y + dy) and
		   self.map:placeFree(self.x + dx, self.y + (self.h-1) + dy) and
		   self.map:placeFree(self.x + (self.w-1) + dx, self.y + (self.h-1) + dy)
end

--rounds a number away from 0
function round(num) 
	if num < 0 then 
		return math.floor(num)
	else 
		return math.ceil(num) 
	end
end