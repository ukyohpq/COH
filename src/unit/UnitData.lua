---
--- Created by ukyohpq.
--- DateTime: 17/11/30 11:10
---

---@class unit.UnitData
---@field id number
---@field type number
---@field width number
---@field height number
---@field hp number
---@field attack number
---@field launchTime number
---@field hpIncrease number

---@type table<number, unit.UnitData>
UnitDatas = {
    [101] = {id = 101, type = 1, width = 1, height = 1, hp = 1, attack = 201, launchTime = -1, hpIncrease = 1},
    [102] = {id = 102, type = 2, width = 1, height = 2, hp = 2, attack = 202, launchTime = -1, hpIncrease = 1},
    [103] = {id = 103, type = 3, width = 2, height = 2, hp = 4, attack = 203, launchTime = -1, hpIncrease = 1},
    [201] = {id = 201, type = 4, width = 1, height = 3, hp = 3, attack = -1, launchTime = -1, hpIncrease = 1},
    [202] = {id = 202, type = 4, width = 1, height = 2, hp = 4, attack = -1, launchTime = -1, hpIncrease = 2},
    [203] = {id = 203, type = 4, width = 2, height = 2, hp = 8, attack = -1, launchTime = -1, hpIncrease = 4},
}

---@class unit.TypeOperation
---@field id number
---@field hold number
---@field delete number
---@field transAttack number
---@field assistTrans number
---@field transDefence number

---@type table<number, unit.TypeOperation>
TypeOperations = {
    [1] = {id = 1, hold = 1, delete = 1, transAttack = 1, assistTrans = 1, transDefence = 1},
    [2] = {id = 2, hold = 1, delete = 1, transAttack = 1, assistTrans = 0, transDefence = 0},
    [3] = {id = 3, hold = 1, delete = 1, transAttack = 1, assistTrans = 0, transDefence = 0},
    [4] = {id = 4, hold = 0, delete = 0, transAttack = 0, assistTrans = 0, transDefence = 0},
}