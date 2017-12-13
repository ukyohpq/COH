---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ukyohpq.
--- DateTime: 17/12/5 18:23
---

---@class operation.OperationComponent
local OperationComponent = class("operation.OperationComponent")

---@return operation.OperationComponent
function OperationComponent:getComponent() return nil end

---canHold
---@param unit unit.Unit
function OperationComponent:canHold(unit) return false end

---canAssistTrans
---@param unit unit.Unit
function OperationComponent:canAssistTrans(unit) return false end

---canTransAttack
---@param unit unit.Unit
function OperationComponent:canTransAttack(unit) return false end

---canTransDefence
---@param unit unit.Unit
function OperationComponent:canTransDefence(unit) return false end

---canDelete
---@param unit unit.UnitData
function OperationComponent:canDelete(unit) return false end

return OperationComponent
