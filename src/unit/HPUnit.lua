---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:50
---

---@class unit.HPUnit:unit.UnitDecorator
local HPUnit = class("unit.HPUnit", require("unit.UnitDecorator"))
---@type unit.UnitDecorator
local super = HPUnit.super

function HPUnit:ctor(component)
    super.ctor(self, component)
end

function HPUnit:setHp(value)
    self.value = value
end

function HPUnit:getHp()
    return self.value
end

return HPUnit