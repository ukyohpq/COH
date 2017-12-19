---
--- Created by ukyohpq.
--- DateTime: 17/12/1 15:06
---

local Sole = require("Sole")

---@class Map
---@field rows Sole[]
---@field lines Sole[]
---@field width number
---@field height number
local Map = class("Map")

function Map:ctor(width, height)
    self.width = width
    self.height = height
    self.rows = {}
    self.lines = {}
    for i = 1, width do
        local line = self.lines[i]
        if line == nil then
            line = Sole.new()
            self.lines[i] = line
        end
        for j = 1, height do
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


---tryAddUnitInGrid
---@param unit Unit
---@param grid Grid
---@return boolean
function Map:tryAddUnitInGrid(unit, grid)
    local w, h = unit:getSize()
    local startRow = grid.row
    local startLine = grid.line
    ---@type Grid[]
    local grids = {}
    for i = startLine, startLine + w  - 1 do
        for j = startRow, startRow + h - 1 do
            local grid = self:getGridByRowAndLine(i, j)
            --没格子了，超出了地图
            if grid == nil then
                return false
            end
            --格子中有东西
            if grid:getUnit() ~= nil then
                return false
            end
            table.insert(grids, grid)
        end
    end
    unit.grids = grids
    for _, grid in ipairs(grids) do
        grid:setUnit(unit)
    end
    return true
end

function Map:removeUnit(unit)
    local grids = unit.grids
    if grids == nil then
        return
    end
    for _, grid in ipairs(grids) do
        grid:setUnit(nil)
    end
end

---getRightGrid
---@param grid Grid
function Map:getRightGrid(grid)
    return self.rows[grid.row]:getGridAt(grid.line + 1)
end

---getDownGrid
---@param grid Grid
function Map:getDownGrid(grid)
    return self.lines[grid.line]:getGridAt(grid.row + 1)
end

---getGridByRowAndLine
---@param row number
---@param line number
---@return Grid
function Map:getGridByRowAndLine(line, row)
    local row = self.rows[row]
    if row == nil then
        return nil
    end
    return row:getGridAt(line)
end

function Map:output()
    local s = ""
    local lastRow = 1
    for i, row in ipairs(self.rows) do
        if i > lastRow then
            s = s .. "\n"
            lastRow = i
        end
        for j = 1, self.width do
            local grid = row:getGridAt(j)
            s = s .. grid:tostring()
        end
    end
    return s
end

return Map
