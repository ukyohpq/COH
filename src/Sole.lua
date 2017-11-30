---
--- Created by ukyohpq.
--- DateTime: 17/11/28 18:38
---

---@class Sole
---@field grids Grid[]
---@field dirty boolean
local Sole = class("Sole")

function Sole:ctor()
    self.grids = {}
end

---addGrid
---@param grid Grid
function Sole:addGrid(grid)
    table.insert(self.grids, grid)
    grid:addEventListener(grid.CHANGE, self.onGridChange, self)
end

---onGridChange
---@param event Event.EventData
function Sole:onGridChange(event)
    self.dirty = true
end

function Sole:isDirty()
    return self.dirty
end

function Sole:getGridAt(index)
    return self.grids[index]
end

function Sole:getLen()
    return #self.grids
end
return Sole
