local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "A-60",
    Model = "rbxassetid://12410210552", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 200,
    MoveDelay = 4,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = false,
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
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"You died to A-60.", "Wait, who is that?"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    Achievements.Get({
       Title = "I know that guy!",
       Desc = "His name is A-60!",
       Reason = "Witness A-60",
       Image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiSPigmVdtPBNJ8p-FHYyi8svi2FZLJt2AnA&usqp=CAU",
    })
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
       Title = "Alternative Timeline",
       Desc = "The one where you die.",
       Reason = "Die to A-60",
       Image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPvqHXQek9MXgBhfz6Y53FK5tHdb7OQYOJnQ&usqp=CAU",
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

