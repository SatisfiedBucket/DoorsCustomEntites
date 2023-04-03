local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Triggered Rush",
    Model = "rbxassetid://12989115124", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 200,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 5
    },
    Cycles = {
        Min = 2,
        Max = 2,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"You died to Triggered Rush.", "It's like Rush I'm guessing, but it comes back a few times.", "You should try what you learned with Ambush."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    Achievements.Get({
       Title = "Daddy Issues",
       Desc = "I'm papa's special boy!",
       Reason = "Witness Triggered Rush",
       Image = "https://tr.rbxcdn.com/bd0a874b97eea089920d64df477f96fc/420/420/Image/Png",
    })
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
       Title = "I'm triggered..",
       Desc = "..and your triggered.",
       Reason = "Die to Triggered Rush",
       Image = "https://i1.sndcdn.com/artworks-LumrMjcQRfFE7nwz-B1Loyg-t500x500.jpg",
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

