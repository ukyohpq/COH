---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:51
---

---@class unit.FormedUnit
local FormedUnit = class("unit.FormedUnit", require("unit.Unit"))
---@type unit.Unit
local super = FormedUnit.super
---ctor
---@param unitData unit.UnitData
---@param color number
function FormedUnit:ctor(unitData, color)
    super.ctor(self, unitData, color)
end

return FormedUnit