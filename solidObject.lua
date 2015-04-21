require "class"
require "object"
SolidObject = class(Object, 
	function(obj,map,active,x,y,w,h,depth)
		Object.__init(obj,map,true,active,depth)
		obj.x,obj.y,obj.w,obj.h = x,y,w,h
		return obj
		end)

function SolidObject:containsPoint(x,y)
	return x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h
end

function SolidObject:collidesWith(other)
	return self.x < other.x + other.w and self.x + self.w > other.x and self.y < other.y + other.h and self.y + self.h > other.y
end