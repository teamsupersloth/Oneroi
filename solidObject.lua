require "class"
require "object"
SolidObject = class(Object, 
	function(obj,x,y,w,h,map,active,depth)
		Object.new(obj,map,true,active,depth)
		obj.x,obj.y,obj.w,obj.h = x or 0,y or 0,w or 0,h or 0
		return obj
		end)

function SolidObject:containsPoint(x,y)
	return x >= self.x and x < self.x + self.w and y >= self.y and y < self.y + self.h
end

function SolidObject:collidesWith(other)
	return self.x < other.x + other.w and self.x + self.w > other.x and self.y < other.y + other.h and self.y + self.h > other.y
end

function SolidObject:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end