---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:58
---

---@class Grid:Event.EventDispatcher
---@field unit Unit
---@field row number
---@field line number
---@field left Grid
---@field right Grid
---@field up Grid
---@field down Grid
local Grid = class("Grid", require("Event.EventDispatcher"))
---@type Event.EventDispatcher
local super = Grid.super
Grid.CHANGE = "CHANGE"

function Grid:ctor(line, row)
    super.ctor(self)
    self.row = row
    self.line = line
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
        return "[ 0 ]"
    end
    return "[ " .. self.unit:tostring() .. " ]"
end
return Grid