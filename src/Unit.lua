---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class Unit
---@field id number
local Unit = class("Unit")

function Unit:ctor(id)
    self.size = {1,1}
    self.grids = {}
    self.id = id
end

function Unit:tostring()
    return tostring(self.id)
end

return Unit