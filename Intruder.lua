---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "The Intruder",
    Model = "rbxassetid://12951199494", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 50,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = true,
    ShatterLights = true,
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
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"The Intruder is quiet, but is similar to how Rush works in a sense.", "Don't worry, this will get harder."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        Achievements.Get({
            Title = "In the Flesh",
            Desc = "Your good at Stealth.",
            Reason = "Survive the Intruder",
            Image = "https://i.ytimg.com/vi/HM6nQZ0r9ho/maxresdefault.jpg",
        })
    end
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    Achievements.Get({
        Title = "Unexpectancy",
        Desc = "The intruder has taken somebody.",
        Reason = "Die to the Intruder",
        Image = "https://i.redd.it/2y5mdwasuil81.jpg",
    })
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
