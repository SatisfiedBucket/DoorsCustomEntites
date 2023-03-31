local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Triggered Ambush",
    Model = "rbxassetid://12304996805", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 500,
    MoveDelay = 0,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 1000,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 3,
        Max = 3,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 200
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"You died to Triggered Ambush.", "I hate him as much as you do.", "He seems to rebound 5 times.", "You've seen him before right?"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    Achievements.Get({
       Title = "If I can find you once..",
       Desc = "I can find you again.",
       Reason = "Witness Triggered Ambush",
       Image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4YSN3-J5KnVyU4CMr__LddX0jLUUfai0zQ&usqp=CAU",
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
       Title = "Dinner's Ready",
       Desc = "We made " .. game.Players.LocalPlayer.Name .. " today!",
       Reason = "Die to Triggered Ambush",
       Image = "https://pic-bstarstatic.akamaized.net/ugc/b4fb0e75f0258e46d16ef20b9d90a6b5.jpeg@1200w_630h_1e_1c_1f.webp",
    })
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

local Sound = Instance.new("Sound", game.Workspace)
Sound.PlayOnRemove = true
Sound.SoundId = "rbxassetid://9120020147"
Sound.Volume = 5
Sound:Destroy()

wait(7)

Spawner.runEntity(entity)
