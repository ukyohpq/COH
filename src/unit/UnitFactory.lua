---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:05
---

---@type table<number, unit.UnitData>
local UnitTemplates = {
    [101] = {id = 101, type = 1, width = 1, height = 1, hp = 1, attack = 201, launchTime = -1, hpIncrease = 1},
    [102] = {id = 102, type = 2, width = 1, height = 2, hp = 2, attack = 202, launchTime = -1, hpIncrease = 1},
    [103] = {id = 103, type = 3, width = 2, height = 2, hp = 4, attack = 203, launchTime = -1, hpIncrease = 1},
    [201] = {id = 201, type = 4, width = 1, height = 3, hp = 3, attack = -1, launchTime = -1, hpIncrease = 1},
    [202] = {id = 202, type = 4, width = 1, height = 2, hp = 4, attack = -1, launchTime = -1, hpIncrease = 2},
    [203] = {id = 203, type = 4, width = 2, height = 2, hp = 8, attack = -1, launchTime = -1, hpIncrease = 4},
}

---@class unit.UnitFactory
local UnitFactory = class("unit.UnitFactory")

---createUnit
---@param templateId number
---@param color number
function UnitFactory:createUnitByTemplateId(templateId, color)
    local unitData = UnitTemplates[templateId]
    local unitClass = require("unit.Unit")
    if unitData.type == 1 then
        unitClass = nil
    elseif unitData.type == 2 then
        unitClass = nil
    elseif unitData.type == 3 then
        unitClass = nil
    elseif unitData.type == 4 then
        unitClass = nil
    end
    return unitClass.new(unitData, color)
end

---getUnitTypeByTemplateId
---@param templateId number
function UnitFactory:getUnitTypeByTemplateId(templateId)
    --if templateId
end

return UnitFactory
