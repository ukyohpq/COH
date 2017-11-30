---
--- Created by ukyohpq.
--- DateTime: 17/11/27 10:53
---
package.path = package.path .. ";../../../../usefulLib/lua/?.lua"
package.path = package.path .. ";../../../usefulLib/lua/?.lua"

require("Utils.Logger")
require("class")
local UnitFactory = require("UnitFactory")
local Side = require("Side")

local selfSide = Side.new()
local unit = UnitFactory:createUnitByTemplateId(1, 1)
print(selfSide:tryAddUnitAt(unit, 3))
logErr(selfSide:output())
