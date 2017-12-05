---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:51
---

---@class unit.FormedUnit:unit.UnitDecorator
local FormedUnit = class("unit.FormedUnit", require("unit.UnitDecorator"))
---@type unit.UnitDecorator
local super = FormedUnit.super
function FormedUnit:ctor(component)
    super.ctor(self, component)
end

return FormedUnit