---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:05
---

---@class UnitFactory
local UnitFactory = class("UnitFactory")
---@type table<number, UnitData>
local map= {}
---createUnit
---@param templateId number
---@param color number
function UnitFactory:createUnitByTemplateId(templateId, color)
    local unitData = map[templateId]
    if unitData == nil then
        unitData = self:createUnitDataByTemplateId(templateId)
        map[templateId] = unitData
    end
    if unitData ~= nil then
        return require("Unit").new(unitData, color)
    end
end

---createUnitByTemplateId
---@param templateId number
function UnitFactory:createUnitDataByTemplateId(templateId)
    local w = 1
    local h = 1
    if templateId == 1 then
        w = 1
        h = 1
    end
    if templateId == 2 then
        w = 1
        h = 2
    end
    if templateId == 3 then
        w = 2
        h = 2
    end
    return require("UnitData").new(templateId, w, h)
end

return UnitFactory
