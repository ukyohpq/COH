---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:05
---

---@type table<number, unit.UnitData>
local UnitDatas = require("unit.UnitData")

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

---getUnitTypeByTemplateId
---@param templateId number
function UnitFactory:getUnitTypeByTemplateId(templateId)
    --if templateId
end

return UnitFactory
