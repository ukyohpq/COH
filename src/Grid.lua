---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:58
---

---@class Grid:Event.EventDispatcher
---@field unit Unit
local Grid = class("Grid", require("Event.EventDispatcher"))
Grid.CHANGE = "CHANGE"

function Grid:ctor()
end

function Grid:getUnit()
    return self.unit
end

function Grid:setUnit(unit)
    self.unit = unit
    self:dispatchEvent(Grid.CHANGE)
end

return Grid