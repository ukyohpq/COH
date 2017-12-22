---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class unit.Unit:Event.EventDispatcher
---@field unitData unit.UnitData
---@field grids Grid[]
---@field color number
local Unit = class("unit.Unit", require("Event.EventDispatcher"))

---ctor
---@param unitData unit.UnitData
---@param color number
function Unit:ctor(unitData, color)
    self.unitData = unitData
    self.grids = {}
    self.color = color
end

function Unit:tostring()
    local s = "tid:" .. self.unitData.id
    if self.color ~= nil then
        s = s .. " color:" .. self.color
    end
    return s
end

function Unit:getSize()
    return self.unitData.width, self.unitData.height
end

function Unit:getAssistSize()
    local unitType = self.unitData.type
    if unitType == 1 then
        return 1, 2
    elseif unitType == 2 then
        return 1, 2
    elseif unitType == 3 then
        return 2, 2
    end
    return -1, -1
end

function Unit:getColor()
    return self.color
end

return Unit