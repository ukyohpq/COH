---
--- Created by ukyohpq.
--- DateTime: 17/11/27 10:53
---
package.path = package.path .. ";../../../../usefulLib/lua/?.lua"
package.path = package.path .. ";../../../usefulLib/lua/?.lua"

require("Utils.Logger")
require("class")
require("COHConst")
require("unit.UnitData")

local UnitFactory = require("unit.UnitFactory")
local Side = require("Side")
local UserData = require("UserData")
local userData = UserData.new()
userData.leadership = 10
local selfSide = Side.new(userData)
selfSide:summon()
logErr(selfSide:output())
logErr(selfSide:holdUnitAt(1))
logErr(selfSide:output())
logErr(selfSide:putHoldingUnitAt(3))
logErr(selfSide:output())
logErr(selfSide:holdUnitAt(6))
logErr(selfSide:output())
logErr(selfSide:putHoldingUnitAt(3))
--local unit1 = UnitFactory:createUnitByTemplateId(101)
--local unit2 = UnitFactory:createUnitByTemplateId(101)
--local unit3 = UnitFactory:createUnitByTemplateId(102)
--local unit4 = UnitFactory:createUnitByTemplateId(103)
--local unit5 = UnitFactory:createUnitByTemplateId(101)
--logErr(selfSide:tryAddUnitAt(unit1, 1))
--logErr(selfSide:tryAddUnitAt(unit2, 2))
--logErr(selfSide:output())
--logErr(selfSide:holdUnitAt(1))
--logErr(selfSide:putHoldingUnitAt(2))
--logErr(selfSide:holdUnitAt(2))
--logErr(selfSide:putHoldingUnitAt(3))
--logErr(selfSide:holdUnitAt(2))
--logErr(selfSide:putHoldingUnitAt(4))
--logErr(selfSide:tryAddUnitAt(unit3, 3))
--logErr(selfSide:tryAddUnitAt(unit4, 3))
--logErr(selfSide:tryAddUnitAt(unit5, 4))
logErr(selfSide:output())