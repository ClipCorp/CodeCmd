local Prompt = Instance.new("ScreenGui")
local Cmd = Instance.new("Frame")
local WindowBar = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Icon = Instance.new("ImageButton")
local Icon_2 = Instance.new("ImageButton")
local History = Instance.new("ScrollingFrame")
local Background = Instance.new("TextBox")
local CommandSender = Instance.new("TextBox")
local myversion = "0.1"
local ver = game:HttpGet("https://raw.githubusercontent.com/ClipCorp/CodeCmd/main/version.txt")

Prompt.Name = "Prompt"
Prompt.Parent = game.CoreGui
Prompt.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Cmd.Name = "Cmd"
Cmd.Parent = Prompt
Cmd.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Cmd.BackgroundTransparency = 0.100
Cmd.Position = UDim2.new(0.119620696, 0, 0.17176868, 0)
Cmd.Size = UDim2.new(0, 666, 0, 438)

WindowBar.Name = "WindowBar"
WindowBar.Parent = Cmd
WindowBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WindowBar.BackgroundTransparency = 1.000
WindowBar.Size = UDim2.new(0, 666, 0, 36)

Close.Name = "Close"
Close.Parent = WindowBar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.945945919, 0, 0, 0)
Close.Size = UDim2.new(0, 36, 0, 36)
Close.Font = Enum.Font.SourceSans
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000

Icon.Name = "Icon"
Icon.Parent = Close
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.Position = UDim2.new(0, 9, 0, 9)
Icon.Size = UDim2.new(0, 18, 0, 18)
Icon.Image = "rbxassetid://6236321099"
Icon.ScaleType = Enum.ScaleType.Crop
Icon.SliceScale = 0.000

Icon_2.Name = "Icon"
Icon_2.Parent = WindowBar
Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BackgroundTransparency = 1.000
Icon_2.Size = UDim2.new(0, 36, 0, 36)
Icon_2.Image = "rbxasset://textures/ui/Controls/command@3x.png"
Icon_2.ScaleType = Enum.ScaleType.Crop
Icon_2.SliceScale = 0.000

History.Name = "History"
History.Parent = Cmd
History.Active = true
History.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
History.BackgroundTransparency = 1.000
History.BorderSizePixel = 0
History.Position = UDim2.new(0, 0, 0.0821917802, 0)
History.Size = UDim2.new(0, 666, 0, 402)
History.ScrollBarThickness = 3

Background.Name = "Background"
Background.Parent = History
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 1.000
Background.Size = UDim2.new(0, 666, 0, 45)
Background.ClearTextOnFocus = false
Background.Font = Enum.Font.SourceSans
Background.MultiLine = true
Background.ShowNativeInput = false
Background.Text = "Command Prompt [Version 0.1]\\n(c) Prompt Corporation\\n\\nU:/Game>"
Background.TextColor3 = Color3.fromRGB(255, 255, 255)
Background.TextSize = 20.000
Background.TextXAlignment = Enum.TextXAlignment.Left
Background.TextYAlignment = Enum.TextYAlignment.Top

CommandSender.Name = "CommandSender"
CommandSender.Parent = Background
CommandSender.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandSender.BackgroundTransparency = 1.000
CommandSender.BorderColor3 = Color3.fromRGB(27, 42, 53)
CommandSender.Position = UDim2.new(0.112612657, 0, 1.31677592, 0)
CommandSender.Size = UDim2.new(0, 575, 0, 21)
CommandSender.ClearTextOnFocus = false
CommandSender.Font = Enum.Font.SourceSans
CommandSender.Text = "print(\"Hello World\")"
CommandSender.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandSender.TextSize = 20.000
CommandSender.TextWrapped = true
CommandSender.TextXAlignment = Enum.TextXAlignment.Left

if myversion ~= ver then
	Cmd:Destroy()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ClipCorp/CodeCmd/main/code.lua"))()
end

local function HHWCFCO_fake_script() -- WindowBar.Drag 
	local script = Instance.new('LocalScript', WindowBar)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Parent.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Parent.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Parent.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Parent.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Parent.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Parent.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Parent.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(HHWCFCO_fake_script)()
local function VUEOYV_fake_script() -- CommandSender.Executer 
	local script = Instance.new('LocalScript', CommandSender)

	script.Parent.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.Return then
			script.Parent.Text = ""
			loadstring(script.Parent.Text)
		end
	end)
end
coroutine.wrap(VUEOYV_fake_script)()
