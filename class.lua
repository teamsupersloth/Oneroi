-- class.lua
-- Compatible with Lua 5.1 (not 5.0).
function class(base, new)
   local c = {}    -- a new class instance
   if not new and type(base) == 'function' then
      new = base
      base = nil
   elseif type(base) == 'table' then
    -- our new class is a shallow copy of the base class!
      for i,v in pairs(base) do
         c[i] = v
      end
      c._base = base
   end
   -- the class will be the metatable for all its objects,
   -- and they will look up their methods in it.
   c.__index = c

   -- expose a constructor which can be called by <classname>(<args>)
   local mt = {}
   mt.__call = function(class_tbl, ...)
   local obj = {}
   setmetatable(obj,c)
   if new then
      new(obj,...)
   else 
      -- make sure that any stuff from the base class is newialized!
      if base and base.new then
      base.new(obj, ...)
      end
   end
   return obj
   end
   c.new = new
   c.is_a = function(self, klass)
      local m = getmetatable(self)
      while m do 
         if m == klass then return true end
         m = m._base
      end
      return false
   end
   setmetatable(c, mt)
   return c
end
