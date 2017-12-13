---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:05
---

---@class unit.UnitFactory
local UnitFactory = class("unit.UnitFactory")

---createUnit
---@param templateId number
---@param color number
function UnitFactory:createUnitByTemplateId(templateId, color)
    local unitData = UnitDatas[templateId]
    local unit = require("unit.Unit").new(unitData, color)
    return unit
end

return UnitFactory
