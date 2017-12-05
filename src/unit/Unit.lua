---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class unit.Unit:unit.UnitComponent
---@field unitData unit.UnitData
---@field grids Grid
local Unit = class("unit.Unit", require("unit.UnitComponent"))

---ctor
---@param unitData unit.UnitData
function Unit:ctor(unitData)
    self.unitData = unitData
    self.grids = {}
end

function Unit:tostring()
    return tostring(self.unitData.id)
end

function Unit:getSize()
    return self.unitData.width, self.unitData.height
end

return Unit