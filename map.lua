require "class"
Map = class(
	function(map,objects)
		map.objects = objects or {}
		return map
	end)

function Map:placeFree(x,y)
	for i,v in ipairs(self.objects) do
		if(v:isSolid() and v:containsPoint(x,y)) then
			print("collision")
			return false
		end
	end
	return true
end

function Map:isColliding(obj)
	if(not obj:is_a(SolidObject)) then
		return false
	end
	for i,v in ipairs(self.objects) do 
		if(v:isSolid() and v ~= obj and v:collidesWith(obj))then
			return true
		end
	end
	return false
end

function Map:update(dt)
	for i,v in ipairs(self.objects) do
		if(v:isActive()) then
			v:update(dt)
		end
	end
end

function keyPressed(key)
	
end

function Map:addObject(object)
	object.map = self
	table.insert(self.objects,object)
	table.sort(self.objects, function(a,b) return a.depth < b.depth end)
end

function Map:draw()
	for i,v in ipairs(self.objects) do
		v:draw()
	end
end