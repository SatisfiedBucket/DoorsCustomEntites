-- Gui to Lua
-- Version: 3.2

-- Instances:

local scriptA90 = Instance.new("ScreenGui")
local a90 = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local main = Instance.new("ImageLabel")
local stop = Instance.new("ImageLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local h = Instance.new("UIGradient")
local annoyed = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

--Properties:

scriptA90.Name = "scriptA-90"
scriptA90.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
scriptA90.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

a90.Name = "a-90"
a90.Parent = scriptA90
a90.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
a90.BackgroundTransparency = 1.000
a90.Position = UDim2.new(0.434869736, 0, 0.376201928, 0)
a90.Size = UDim2.new(0.136940554, 0, 0.246394232, 0)
a90.Visible = false
a90.Image = "rbxassetid://12350997663"

UIAspectRatioConstraint.Parent = a90
UIAspectRatioConstraint.AspectRatio = 1.000

main.Name = "main"
main.Parent = scriptA90
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 1.000
main.Size = UDim2.new(1, 0, 1, 0)
main.Visible = false
main.ZIndex = 0
main.Image = "rbxassetid://11826279208"
main.ScaleType = Enum.ScaleType.Tile
main.TileSize = UDim2.new(0.200000003, 0, 0.400000006, 0)

stop.Name = "stop"
stop.Parent = main
stop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stop.BackgroundTransparency = 1.000
stop.Position = UDim2.new(0.426840305, 0, 0.361778826, 0)
stop.Size = UDim2.new(0.161694169, 0, 0.275241226, 0)
stop.Image = "rbxassetid://12440673931"

UIAspectRatioConstraint_2.Parent = stop
UIAspectRatioConstraint_2.AspectRatio = 1.006

h.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
h.Rotation = 90
h.Name = "h"
h.Parent = main

annoyed.Name = "annoyed"
annoyed.Parent = main
annoyed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
annoyed.BackgroundTransparency = 1.000
annoyed.Position = UDim2.new(0.324649423, 0, 0.185096145, 0)
annoyed.Size = UDim2.new(0.349365383, 0, 0.628605783, 0)
annoyed.Visible = false
annoyed.Image = "rbxassetid://12351005336"

TextButton.Parent = scriptA90
TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton.Position = UDim2.new(0.0471451953, 0, 0.759615362, 0)
TextButton.Size = UDim2.new(0.133600533, 0, 0.0612980761, 0)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "A-90 test button"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner.Parent = TextButton

-- Scripts:

local function MGEDI_fake_script() -- annoyed.LocalScript 
	local script = Instance.new('LocalScript', annoyed)

	local Positions = {
		UDim2.new(0.317, 0, 0.184, 0),
		UDim2.new(0.349, 0, 0.185, 0),
		UDim2.new(0.328, 0, 0.212, 0),
		UDim2.new(0.335, 0 ,0.145, 0),
		UDim2.new(0.325, 0, 0.209, 0),
		UDim2.new(0.359, 0, 0.141, 0)
	}
	
	while wait() do
		script.Parent.ImageColor3 = Color3.new(255, 0, 0)
		script.Parent.Position = Positions[math.random(1, #Positions)]
		wait()
		script.Parent.ImageColor3 = Color3.new(255, 255, 255)
		script.Parent.Position = Positions[math.random(1, #Positions)]
		wait()
	end
end
coroutine.wrap(MGEDI_fake_script)()
local function IKSSRC_fake_script() -- main.LocalScript 
	local script = Instance.new('LocalScript', main)

	local Sizes = {
		UDim2.new(0.2, 0, 0.5, 0),
		UDim2.new(0.5, 0, 0.8, 0),
		UDim2.new(0.1, 0, 0.2, 0),
		UDim2.new(0.5, 0, 1, 0),
		UDim2.new(0.2, 0, 0.4, 0)
	}
	
	while wait() do
		script.Parent.TileSize = Sizes[math.random(1, #Sizes)]
	end
end
coroutine.wrap(IKSSRC_fake_script)()
local function COHU_fake_script() -- scriptA90.Attack 
	local script = Instance.new('LocalScript', scriptA90)

	local RS = game:GetService("ReplicatedStorage")
	local Player = game.Players.LocalPlayer
	local Character = Player.Character
	local Humanoid = Character:WaitForChild("Humanoid")
	script.Parent["a-90"].Visible = false
	
	function Attack()
		script.Parent["a-90"].ImageColor3 = Color3.new(255, 255, 255)
		script.Parent["a-90"].Visible = true
		script.Parent["a-90"].Position = UDim2.new(0.18, 0, 0.189, 0)
		script.Spawn:Play()
		wait(0.7)
		script.Parent.main.Visible = true
		script.Parent.main.stop.Visible = false
		script.Parent.main.annoyed.Visible = false
		script.Parent.main.ImageColor3 = Color3.new(0, 0, 0)
		script.Parent["a-90"].Position = UDim2.new(0.435, 0, 0.376, 0)
		wait(0.1)
		script.Parent.main.ImageColor3 = Color3.new(255, 255, 255)
		script.Parent.main.stop.Visible = true
		script.Parent["a-90"].Visible = false
		wait(0.4)
		if Humanoid.MoveDirection.Magnitude > 0 then
			script.Kill:Play()
			script.Parent.main.stop.Visible = false
			script.Parent.main.annoyed.Visible = true
			wait(0.8)
			script.Parent["a-90"].Visible = false
			script.Parent.main.Visible = false
			Humanoid.Health = 0
		else
			wait(0.1)
			script.Parent["a-90"].Visible = true
			script.Parent.main.stop.Visible = false
			wait(0.1)
			script.Parent["a-90"].ImageColor3 = Color3.new(255, 0, 0)
			wait(0)
			script.Parent["a-90"].ImageColor3 = Color3.new(255, 255, 255)
			script.Parent["a-90"].Visible = false
			script.Parent.main.Visible = false
		end
	end
	
	script.Parent.TextButton.MouseButton1Click:Connect(Attack)
	
	
end
coroutine.wrap(COHU_fake_script)()
