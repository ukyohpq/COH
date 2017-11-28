---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:58
---

---@class Grid:Event.EventDispatcher
---@field unit Unit
local Grid = class("Grid", require("Event.EventDispatcher"))
---@type Event.EventDispatcher
local super = Grid.super
Grid.CHANGE = "CHANGE"

function Grid:ctor()
    super.ctor(self)
end

function Grid:getUnit()
    return self.unit
end

function Grid:setUnit(unit)
    self.unit = unit
    self:dispatchEvent(Grid.CHANGE)
end

function Grid:tostring()
    if self.unit == nil then
        return "0"
    end
    return self.unit
end
return Grid