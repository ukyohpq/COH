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
local unit1 = UnitFactory:createUnitByTemplateId(1, 1)
local unit2 = UnitFactory:createUnitByTemplateId(1, 1)
logErr(selfSide:tryAddUnitAt(unit1, 1))
logErr(selfSide:tryAddUnitAt(unit2, 2))
logErr(selfSide:output())
logErr(selfSide:holdUnitAt(1))
logErr(selfSide:putHoldingUnitAt(2))
--logErr(selfSide:holdUnitAt(2))
logErr(selfSide:output())

