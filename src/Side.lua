---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:43
---

---@class Side
---@field map Map
---@field units table<Unit, boolean>
---@field holdingUnit Unit
---@field holdingLine number
---@field point number
local Side = class("Side")

function Side:ctor()
    self.map = require("Map").new(8, 6)
    self.units = {}
    self.point = 3
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
    for i = 1, lineSole:getLen() do
        local grid = lineSole:getGridAt(i)
        local unit = grid:getUnit()
        if unit ~= nil then
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
    if self:tryAddUnitAt(self.holdingUnit, line) then
        self.holdingUnit = nil
        if self.holdingLine ~= line then
            self.point = self.point - 1
            self:checkMoveResult()
        end
        self.holdingLine = nil
    end
end

function Side:checkMoveResult()
    logErr("Side:checkMoveResult")
end


return Side