---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:10
---

---@class UnitData
---@field id number
---@field width number
---@field height number
local UnitData = class("UnitData")

function UnitData:ctor(id, width, height)
    self.id = id
    self.width = width
    self.height = height
end

return UnitData
