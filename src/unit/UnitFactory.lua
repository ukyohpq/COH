---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:05
---

--local ColorUnit = require("unit.ColorUnit")
--local FormedUnit= require("unit.FormedUnit")
--local HoldableUnit = require("unit.HoldableUnit")
--local HPUnit = require("unit.HPUnit")
--local TransAttackUnit = require("unit.TransAttackUnit")
--local TransDefenceUnit = require("unit.TransDefenceUnit")


---@type table<number, unit.UnitData>
local UnitDatas = require("unit.UnitData")

---@class unit.UnitFactory
local UnitFactory = class("unit.UnitFactory")

---createUnit
---@param templateId number
---@param color number
function UnitFactory:createUnitByTemplateId(templateId, color)
    local unitData = UnitDatas[templateId]
    local unit = require("unit.Unit").new(unitData)
    --if unitData.type == 1 then
    --    unit = ColorUnit.new(HoldableUnit.new(HPUnit.new(TransAttackUnit.new(TransDefenceUnit.new(unit)))))
    --elseif unitData.type == 2 then
    --    unit = ColorUnit.new(HoldableUnit.new(HPUnit.new(TransAttackUnit.new(unit))))
    --elseif unitData.type == 3 then
    --    unit = ColorUnit.new(HoldableUnit.new(HPUnit.new(TransAttackUnit.new(unit))))
    --elseif unitData.type == 4 then
    --    unit = ColorUnit.new(HPUnit.new(FormedUnit.new(unit)))
    --end
    return unit
end

---getUnitTypeByTemplateId
---@param templateId number
function UnitFactory:getUnitTypeByTemplateId(templateId)
    --if templateId
end

return UnitFactory
