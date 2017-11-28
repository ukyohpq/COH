---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:45
---

---@class Unit
local Unit = class("Unit")

function Unit:ctor()
    self.size = {1,1}
    self.grids = {}
end

return Unit