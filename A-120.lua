---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "A-120",
    Model = "rbxassetid://12950862914", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 100,
    MoveDelay = 3,
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
    DeathMessage = {"Something called A-120 murdered you..", "I've never seen them before though."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    Achievements.Get({
            Title = "Au Revoir",
            Desc = "We will meet again.",
            Reason = "Witness A-120",
            Image = "https://us-tuna-sounds-images.voicemod.net/85ce7c8c-cb4b-4534-b2cd-1a689e87d885-1678570441511.jfif",
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
        Title = "Backwards and Forwards",
        Desc = "You didn't expect me did you?",
        Reason = "Die to A-120",
        Image = "https://img.quizur.com/f/img63dc005c30eb92.66716249.jpg?lastEdited=1675362399",
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
