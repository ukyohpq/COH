---
--- Created by ukyohpq.
--- DateTime: 17/11/27 10:53
---
package.path = package.path .. ";../../../usefulLib/lua/?.lua"
require("Utils.Logger")
require("class")
local Side = require("Side")

local selfSide = Side.new()
logErr(selfSide:output())
