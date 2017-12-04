---
--- Created by ukyohpq.
--- DateTime: 17/12/1 19:07
---

---@class UserData
---@field level number
---@field hp number
---@field mp number
---@field leadership number
---@field lineup number[]
local UserData = class("UserData")
UserData.level = 1
UserData.hp = 30
UserData.mp = 0
UserData.leadership = 30
return