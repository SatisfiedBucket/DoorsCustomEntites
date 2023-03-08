local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()


-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "Triggered Ambush", -- Custom name of your entity
    Model = "rbxassetid://12304996805", -- Can be GitHub file or rbxassetid
    Speed = 500, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    BackwardsMovement = false,
    BreakLights = false,
    FlickerLights = {
        false, -- Enabled/Disabled
        5, -- Time (seconds)
    },
    Cycles = {
        Min = 5,
        Max = 10,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        200, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Triggered Ambush.", "Remember that old Green idiot? Yeah, just him but worse.", "Try again, we still have more time.."}, -- Custom death message
})


-----[[  Debug -=- Advanced  ]]-----
entityTable.Debug.OnEntitySpawned = function()
    print("Entity has spawned:", entityTable)
end

entityTable.Debug.OnEntityDespawned = function()
    Achievements.Get({
       Title = "If I can find you once..",
       Desc = "I can find you again.",
       Reason = "Witness Triggered Ambush",
       Image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4YSN3-J5KnVyU4CMr__LddX0jLUUfai0zQ&usqp=CAU",
    })
end

entityTable.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:", entityTable)
end

entityTable.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:", entityTable)
end

entityTable.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entityTable, "has entered room:", room)
end

entityTable.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:", entityTable)
end

entityTable.Debug.OnDeath = function()
    Achievements.Get({
       Title = "Dinner's Ready",
       Desc = "We made " .. game.Players.LocalPlayer.Name .. " today!",
       Reason = "Die to Triggered Ambush",
       Image = "https://pic-bstarstatic.akamaized.net/ugc/b4fb0e75f0258e46d16ef20b9d90a6b5.jpeg@1200w_630h_1e_1c_1f.webp",
    })
end
------------------------------------


-- Run the created entity
local Sound = Instance.new("Sound", game.Workspace)
Sound.PlayOnRemove = true
Sound.SoundId = "rbxassetid://9120020147"
Sound:Destroy()

wait(7)

Spawner.runEntity(entityTable)
