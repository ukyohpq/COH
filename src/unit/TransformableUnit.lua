---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ukyohpq.
--- DateTime: 17/12/4 10:41
---

---@class unit.TransformableUnit
local TransformableUnit = class("unit.TransformableUnit", require("unit.ColorUnit"))
---@type unit.ColorUnit
local super = TransformableUnit.super

function TransformableUnit:ctor(unitData, color)
    super.ctor(self, unitData, color)
end

function TransformableUnit:transAttack()

end

function TransformableUnit:transDefence()

end

return TransformableUnit
