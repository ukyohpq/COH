---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class Unit
---@field unitData UnitData
---@field grids Grid
---@field color number
local Unit = class("Unit")

---ctor
---@param unitData UnitData
function Unit:ctor(unitData, color)
    self.unitData = unitData
    self.grids = {}
    self.color = color
end

function Unit:tostring()
    return tostring(self.unitData.id)
end

function Unit:getSize()
    return self.unitData.width, self.unitData.height
end

return Unit