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
local unit3 = UnitFactory:createUnitByTemplateId(2, 1)
local unit4 = UnitFactory:createUnitByTemplateId(3, 1)
local unit5 = UnitFactory:createUnitByTemplateId(1, 1)
logErr(selfSide:tryAddUnitAt(unit1, 1))
logErr(selfSide:tryAddUnitAt(unit2, 2))
logErr(selfSide:output())
logErr(selfSide:holdUnitAt(1))
logErr(selfSide:putHoldingUnitAt(2))
logErr(selfSide:holdUnitAt(2))
logErr(selfSide:putHoldingUnitAt(3))
logErr(selfSide:holdUnitAt(2))
logErr(selfSide:putHoldingUnitAt(4))
logErr(selfSide:tryAddUnitAt(unit3, 3))
logErr(selfSide:tryAddUnitAt(unit4, 3))
logErr(selfSide:tryAddUnitAt(unit5, 4))
logErr(selfSide:output())

