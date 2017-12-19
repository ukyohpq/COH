---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:43
---

local Map = require("Map")

---@class Side
---@field map Map
---@field units table<Unit, boolean>
---@field holdingUnit Unit
---@field holdingLine number
---@field userData UserData
---@field operator operation.OperationComponent
local Side = class("Side")

---ctor
---@param userData UserData
function Side:ctor(userData)
    self.map = Map.new(COHConst.MAX_LINE, COHConst.MAX_ROW)
    self.units = {}
    self.userData = userData
    self:initOperator()
end

function Side:initOperator()
    self.operator = require("operation.OperationNormal").new()
end

function Side:output()
    local mapRet = self.map:output()
    local s = mapRet .. "\n"
    if self.holdingUnit == nil then
        s = s .. "holdingUnit:" .. " nil " .. "holdingLine:" .. " nil"
    else
        s = s .. "holdingUnit:" .. self.holdingUnit:tostring() .. " holdingLine:" .. self.holdingLine
    end
    return s
end


---addUnit
---@param unit Unit
---@param line number
---@return boolean
function Side:tryAddUnitAt(unit, line)
    if self.units[unit] == true then
        return false
    end
    local map = self.map
    local line = map.lines[line]
    if line == nil then
        return false
    end
    local firstEmptyGridIndex = 1
    local lineLen = line:getLen()
    for i = lineLen, 1, -1 do
        if line:getGridAt(i):getUnit() ~= nil then
            firstEmptyGridIndex = i + 1
            break
        end
    end
    if firstEmptyGridIndex > lineLen then
        return false
    end
    for i = firstEmptyGridIndex, lineLen do
        local grid = line:getGridAt(i)
        if grid == nil then
            print(firstEmptyGridIndex, lineLen, i)
        end
        if grid:getUnit() == nil then
            if map:tryAddUnitInGrid(unit, grid) then
                self.units[unit] = true
                return true
            end
        end
    end
    return false
end

function Side:holdUnitAt(line)
    if self.holdingUnit ~= nil then
        return false
    end
    local map = self.map
    local lineSole = map.lines[line]
    if lineSole == nil then
        return false
    end
    for i = lineSole:getLen(), 1, -1 do
        local grid = lineSole:getGridAt(i)
        local unit = grid:getUnit()
        if unit ~= nil and self.operator:canHold(unit) then
            map:removeUnit(unit)
            self.units[unit] = nil
            self.holdingUnit = unit
            self.holdingLine = line
            return true
        end
    end
    return false
end

function Side:putHoldingUnitAt(line)
    if self.holdingUnit == nil then
        return
    end
    local movedUnit = self.holdingUnit
    if self:tryAddUnitAt(movedUnit, line) then
        self.holdingUnit = nil
        if self.holdingLine ~= line then
            self.userData.point = self.userData.point - 1
            self:checkMoveResult(movedUnit)
        end
        self.holdingLine = nil
    end
end

local MoveState = {
    NORMAL = 1,
    CHECK_LINE = 2,
    CHECK_ROW = 3,
    CHECK_MERGE = 4,
    SWAP = 5,
}
---checkMoveResult
---@param movedUint unit.Unit
function Side:checkMoveResult(movedUint)
    local grid = movedUint.grids[1]
    local state = MoveState.NORMAL
    local line = self.map.lines[grid.line]
    local row = self.map.rows[grid.row]
    while true do
        if state == MoveState.NORMAL then
            if self.operator:canAssistTrans(movedUint) then
                state = MoveState.CHECK_LINE
            elseif self.operator:canAssistDefence(movedUint) then
                state = MoveState.CHECK_ROW
            end
        elseif state == MoveState.CHECK_LINE then
            for i = grid.row - 1, 1, -1 do
                --if
            end
        elseif state == MoveState.CHECK_ROW then

        elseif state == MoveState.CHECK_MERGE then

        elseif state == MoveState.SWAP then

        end
    end
end

function Side:summon()
    local leadership = self.userData.leadership
    local UnitFactory = require("unit.UnitFactory")
    for i = 1, leadership do
        local unit = UnitFactory:createUnitByTemplateId(101, (i - 1) % 3 + 1)
        self:tryAddUnitAt(unit, (i - 1) % 8 + 1)
    end
end

return Side