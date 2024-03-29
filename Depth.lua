---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Depth",
    Model = "rbxassetid://11535848347", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 200,
    MoveDelay = 5,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 2
    },
    CamShake = {
        Enabled = false,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"Depth isn't someone I've seen before, but he is familiar.", "If I haven't forgotten, he's the one that comes back.", "He's also handsome, but don't fall for him."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityStartMoving = function()
    -- Begin move
end

entity.Debug.OnEntityFinishedRebound = function()
    -- Rebound done
end

entity.Debug.OnEntityEnteredRoom = function(room)
    -- Entered room
end

entity.Debug.OnLookAtEntity = function()
    -- Looking at bozo
end

entity.Debug.OnDeath = function()
    Achievements.Get({
        Title = "Into the Depths",
        Desc = "He was never seen again.",
        Reason = "Die to Depth",
        Image = "https://static.wikia.nocookie.net/doors-ideas/images/d/de/Closet-master-new.png/revision/latest/scale-to-width-down/120?cb=20221213222443",
    })
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

Spawner.runEntity(entity)
