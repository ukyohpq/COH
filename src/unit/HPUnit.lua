---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:50
---

---@class unit.HPUnit @普通单位
local HPUnit = class("unit.HPUnit", require("unit.Unit"))
---@type unit.Unit
local super = HPUnit.super
---ctor
---@param unitData unit.UnitData
---@param color number
function HPUnit:ctor(unitData, color)
    super.ctor(self, unitData, color)
end

function HPUnit:form()

end
return HPUnit