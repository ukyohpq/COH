---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ukyohpq.
--- DateTime: 17/12/6 14:03
---

---@class operation.OperationHP
local OperationHP = class("operation.OperationHP", require("operation.OperationDecorator"))
---@type operation.OperationDecorator
local super = OperationHP.super

function OperationHP:ctor(component)
    super.ctor(self, component)
end

return OperationHP