---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class unit.Unit:unit.UnitComponent
---@field unitData unit.UnitData
---@field grids Grid
---@field operator operation.OperationComponent
local Unit = class("unit.Unit")

---ctor
---@param unitData unit.UnitData
function Unit:ctor(unitData)
    self.unitData = unitData
    self.grids = {}
    self.operator = require("operation.OperationComponent").new()
    self:createOperator()
end

function Unit:tostring()
    return tostring(self.unitData.id)
end

function Unit:getSize()
    return self.unitData.width, self.unitData.height
end

function Unit:createOperator()
    local dataType = self.unitData.type
    if dataType == 1 then
    elseif dataType == 2 then
    elseif dataType == 3 then
    elseif dataType == 4 then
    end
end
return Unit