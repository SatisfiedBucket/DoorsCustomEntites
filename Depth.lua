local UltraNightmare = game.Workspace:FindFirstChild("Ultra-Nightmare") or Instance.new("Folder", game.Workspace)
local DoorNumber = game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")
local RS = game:GetService("ReplicatedStorage")

UltraNightmare.Name = "Ultra-Nightmare"

local DepthRebounds = game.Workspace:FindFirstChild("Ultra-Nightmare"):FindFirstChild("DepthReboundsLeft") or Instance.new("IntValue", UltraNightmare)
DepthRebounds.Name = "DepthReboundsLeft"
DepthRebounds.Value = 5

local Attacked = game.Workspace:FindFirstChild("Ultra-Nightmare"):FindFirstChild("Attacked") or Instance.new("BoolValue", UltraNightmare)
Attacked.Name = "Attacked"

local d = DepthRebounds
local a = Attacked

a.Value = true


-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "Depth", -- Custom name of your entity
    Model = "rbxassetid://11535848347", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 0, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BackwardsMovement = false,
    BreakLights = true,
    FlickerLights = {
        false, -- Enabled/Disabled
        5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 0,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
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
    CustomDialog = {"Depth isn't someone I've seen before, but he is familiar.", "If I haven't forgotten, he's the one that comes back.", "He's also pretty, but don't fall for him."}, -- Custom death message
})


-----[[  Debug -=- Advanced  ]]-----
entityTable.Debug.OnEntitySpawned = function()
    print("Entity has spawned:", entityTable)
end

entityTable.Debug.OnEntityDespawned = function()

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
    firesignal(RS.Bricks.DeathHint.OnClientEvent, CustomDialog, "Blue")
    
    Achievements.Get({
        Title = "Into the Depths",
        Desc = "He was never seen again.",
        Reason = "Die to Depth",
        Image = "https://static.wikia.nocookie.net/doors-ideas/images/d/de/Closet-master-new.png/revision/latest/scale-to-width-down/120?cb=20221213222443",
    })
end
------------------------------------


-- Run the created entity
DoorNumber.Changed:Connect(function()
    if d.Value > 0 then
        d.Value = d.Value - 1
        Spawner.runEntity(entityTable)
    else
        return
    end
end)
