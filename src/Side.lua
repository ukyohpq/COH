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
            local grid = require("Grid").new()
            row:addGrid(grid)
            line:addGrid(grid)
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
return Side