---
--- Created by ukyohpq.
--- DateTime: 17/11/28 17:43
---

local width = 8
local hight = 6

local Sole = require("Sole")
---@class Side
---@field rows Sole[]
---@field lines Sole[]
local Side = class("Side")

function Side:ctor()
    self.rows = {}
    self.lines = {}
    for i = 1, width do
        local line = self.lines[i]
        if line == nil then
            line = Sole.new()
            self.lines[i] = line
        end
        for j = 1, hight do
            local row = self.rows[j]
            if row == nil then
                row = Sole.new()
                self.rows[j] = row
            end
            local grid = require("Grid").new(i, j)
            row:addGrid(grid)
            line:addGrid(grid)
            local leftLine = self.lines[i - 1]
            local upRow = self.rows[j - 1]
            if leftLine ~= nil then
                local leftGrid = leftLine:getGridAt(j)
                leftGrid.right = grid
                grid.left = leftGrid
            end
            if upRow ~= nil then
                local upGrid = upRow:getGridAt(i)
                upGrid.down = grid
                grid.up = upGrid
            end
        end
    end
end

function Side:output()
    local s = ""
    local lastRow = 1
    for i, row in ipairs(self.rows) do
        if i > lastRow then
            s = s .. "\n"
            lastRow = i
        end
        for j = 1, width do
            local grid = row:getGridAt(j)
            s = s .. grid:tostring()
        end
    end
    return s
end


---addUnit
---@param unit Unit
---@param line number
---@return boolean
function Side:tryAddUnitAt(unit, line)
    local line = self.lines[line]
    for i = 1, line:getLen() do
        local grid = line:getGridAt(i)
        if grid:getUnit() == nil then
            if self:tryAddUnitInGrid(unit, grid) then
                return true
            end
        end
    end
    return false
end

---tryAddUnitInGrid
---@param unit Unit
---@param grid Grid
---@return boolean
function Side:tryAddUnitInGrid(unit, grid)
    local w, h = unit:getSize()
    local startRow = grid.row
    local startLine = grid.line
    ---@type Grid[]
    local grids = {}
    for i = startLine, w do
        for j = startRow, h do
            local grid = self:getGridByRowAndLine(i, j)
            --没格子了，超出了地图
            if grid == nil then
                return false
            end
            --格子中有东西
            if grid:getUnit() ~= nil then
                return false
            end
            print(2)
            table.insert(grids, grid)
        end
    end
    for _, grid in ipairs(grids) do
        print("asfsdaf")
        grid:setUnit(unit)
    end
    return true
end

---getRightGrid
---@param grid Grid
function Side:getRightGrid(grid)
    return self.rows[grid.row]:getGridAt(grid.line + 1)
end

---getDownGrid
---@param grid Grid
function Side:getDownGrid(grid)
    return self.lines[grid.line]:getGridAt(grid.row + 1)
end

---getGridByRowAndLine
---@param row number
---@param line number
---@return Grid
function Side:getGridByRowAndLine(line, row)
    local row = self.rows[row]
    if row == nil then
        return nil
    end
    return row:getGridAt(line)
end

return Side