require "class"
Object = class(
	function(obj,map,solid,active,depth)
		obj.map = map or {}
		obj.solid = solid or false
		obj.active = active or false
		obj.depth = depth or 0
		return obj
	end)

function Object:isActive()
	return self.active
end

function Object:isSolid()
	return self.solid
end

function Object:draw()
	-- Must be overwritten
end

function Object:update(dt)
	-- Must be overwritten
end

function Object:keyPressed(key)
	-- Must be overwritten
end