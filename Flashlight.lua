local FlashlightPart = game.Workspace:FindFirstChild("FlashlightPartScript") or Instance.new("Part", game.Workspace)
FlashlightPart.Name = "FlashlightPartScript"
local Light = FlashlightPart:FindFirstChild("FlashlightScript") or Instance.new("SpotLight", FlashlightPart)
local UIS = game:GetService("UserInputService")
local Sound = game:GetService("SoundService"):FindFirstChild("FlashlightClickSoundScript") or Instance.new("Sound", game:GetService("SoundService"))
local Camera = game.Workspace.CurrentCamera

Sound.SoundId = "rbxassetid://5991592592"
Sound.Volume = 10

FlashlightPart.Transparency = 1
FlashlightPart.CanCollide = false
FlashlightPart.Anchored = true

Light.Name = "FlashlightScript"
Light.Range = 30
Light.Brightness = 2

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T and not UIS:GetFocusedTextBox() then
        if Light.Enabled == true then
            Light.Enabled = false
        else
            Light.Enabled = true
        end
        Sound:Play()
    end
end)

while wait() do
    FlashlightPart.CFrame = FlashlightPart.CFrame:lerp(Camera.CFrame, .25)
    if not game.PlaceId == 6839171747 then
        game.Lighting.ClockTime = 1
        game.Lighting.Brightness = 0.3
    end
end
