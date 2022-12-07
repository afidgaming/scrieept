local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()
local window = lib.createWindow("FAVKED 1.0", "FAVKED 1.0", true) 
local tab1 = window.createTab("scropts")
local section1 = tab1.createSection("scripts", false)
local section3 = tab1.createSection("game specific", false)
local tab2 = window.createTab("admins")
local section2 = tab2.createSection("admins", false)

--SCRIPTS

section1.createText("Credits to the original creators")

section1.createButton("Harked v2", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/afidgaming/scrieept/main/hark.lua'))()
end)

section1.createButton("R15 NPC CONTROL", function()
	-- Variables
	local mouse = game.Players.LocalPlayer:GetMouse()
	local uis = game:GetService("UserInputService")

	-- Connect
	mouse.Button1Down:Connect(function()
		-- Check for Target & Left Shift
		if mouse.Target and uis:IsKeyDown(Enum.KeyCode.LeftControl) then
			local npc = mouse.target.Parent
			local npcRootPart = npc.HumanoidRootPart
			local PlayerCharacter = game:GetService("Players").LocalPlayer.Character
			local PlayerRootPart = PlayerCharacter.HumanoidRootPart
			local A0 = Instance.new("Attachment")
			local AP = Instance.new("AlignPosition")
			local AO = Instance.new("AlignOrientation")
			local A1 = Instance.new("Attachment")
			for _, v in pairs(npc:GetDescendants()) do
				if v:IsA("BasePart") then
					game:GetService("RunService").Stepped:Connect(function()
						v.CanCollide = false
					end)
				end
			end
			PlayerRootPart:BreakJoints()
			for _, v in pairs(PlayerCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					if v.Name == "HumanoidRootPart" or v.Name == "UpperTorso" or v.Name == "Head" then
					else
						v:Destroy()
					end
				end
			end
			PlayerRootPart.Position = PlayerRootPart.Position+Vector3.new(5, 0, 0)
			PlayerCharacter.Head.Anchored = true
			PlayerCharacter.UpperTorso.Anchored = true
			A0.Parent = npcRootPart
			AP.Parent = npcRootPart
			AO.Parent = npcRootPart
			AP.Responsiveness = 200
			AP.MaxForce = math.huge
			AO.MaxTorque = math.huge
			AO.Responsiveness = 200
			AP.Attachment0 = A0
			AP.Attachment1 = A1
			AO.Attachment1 = A1
			AO.Attachment0 = A0
			A1.Parent = PlayerRootPart
		end
	end)
end)

section1.createButton("Fe R6/R15 Headless", function()
	-- services
	local players = game:GetService("Players")
	local starterGui = game:GetService("StarterGui")
	-- objects
	local player = players.LocalPlayer
	local character = player.Character
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local head, torso = character:FindFirstChild("Head"), character:FindFirstChild("UpperTorso")
	local resetBindable = Instance.new("BindableEvent")
	-- variables
	local destroyFunc, resetBindableConnection = character.Destroy, nil
	-- main
	-- initializes the permadeath
	player.Character = nil
	player.Character = character
	task.wait(players.RespawnTime + .05)

	humanoid.BreakJointsOnDeath = false
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		task.defer(destroyFunc, (head.Neck))
	end
	task.defer(destroyFunc, head) -- and we destroy the head

	resetBindableConnection = resetBindable.Event:Connect(function()
		starterGui:SetCore("ResetButtonCallback", true)
		resetBindableConnection:Disconnect()

		if player.Character == character then
			character:Destroy()
			local daModel = Instance.new("Model")
			local _daModelHumanoid = Instance.new("Humanoid")
			_daModelHumanoid.Parent = daModel
			player.Character = daModel

			task.delay(players.RespawnTime, destroyFunc, daModel)
		else
			player.Character:BreakJoints()
		end
	end)
	starterGui:SetCore("ResetButtonCallback", resetBindable)

	window.notification("Notice!", "Sometimes it just resets your character for other people (only you can see it)")

end)

section1.createButton("walkable hats", function()
	window.notification("Notice!", "If the hats are dissapearing reset your character")
	for _, v in pairs(game.Players.LocalPlayer.Character:getChildren()) do
		if v.ClassName == "Accessory" then
			for i, k in pairs(v:GetDescendants()) do
				if k.ClassName == "Attachment" then
					local s = Instance.new("RopeConstraint")
					k.Parent.CanCollide = true
					s.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					s.Attachment1 = k
					s.Attachment0 = game.Players.LocalPlayer.Character.Head.FaceCenterAttachment
					s.Visible = true
					s.Length = 10
					v.Handle.AccessoryWeld:Destroy()
				end
			end
		end
	end
end)

section1.createButton("Unanchored GUI", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
end)

section1.createButton("Annoy Gui", function()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local TextButton = Instance.new("TextButton")
	local TextBox = Instance.new("TextBox")
	local Stop = Instance.new("TextButton")
	local TextButton_2 = Instance.new("TextButton")
	local Stopped = Instance.new("NumberValue")

	--Properties:
	Stopped.Name = "Stopped"
	Stopped.Parent = ScreenGui
	Stopped.Value = 0

	--Properties:

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false

	TextButton.Parent = ScreenGui
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 0.500
	TextButton.Size = UDim2.new(0, 200, 0, 50)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = "Anoy"
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true

	TextBox.Parent = ScreenGui
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 0.500
	TextBox.Position = UDim2.new(0, 0, 0.0621890537, 0)
	TextBox.Size = UDim2.new(0, 200, 0, 50)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.Text = "Username"
	TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.TextSize = 14.000

	Stop.Name = "Stop"
	Stop.Parent = ScreenGui
	Stop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Stop.BackgroundTransparency = 0.500
	Stop.Position = UDim2.new(0, 200, 0, 0)
	Stop.Size = UDim2.new(0, 200, 0, 50)
	Stop.Font = Enum.Font.SourceSans
	Stop.Text = "Stop"
	Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
	Stop.TextScaled = true
	Stop.TextSize = 14.000
	Stop.TextWrapped = true

	TextButton_2.Parent = ScreenGui
	TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_2.BackgroundTransparency = 0.500
	TextButton_2.Position = UDim2.new(0, 200, 0, 50)
	TextButton_2.Size = UDim2.new(0, 200, 0, 50)
	TextButton_2.Font = Enum.Font.SourceSans
	TextButton_2.Text = "SUPER ANOY"
	TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_2.TextScaled = true
	TextButton_2.TextSize = 14.000
	TextButton_2.TextWrapped = true

	-- Scripts:

	local function VXTUVGF_fake_script() -- TextButton.LocalScript 
		local script = Instance.new('LocalScript', TextButton)

		--Usernamesareforgeeks1#0860
		script.Parent.MouseButton1Down:Connect(function(click)
			while wait() do
				local power = script.Parent.Parent.TextBox.Text
				local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
				local target = script.Parent.Parent.TextBox.Text
				p1.CFrame = game.Players[target].Character.HumanoidRootPart.CFrame
				p1.CFrame = p1.CFrame *CFrame.fromEulerAnglesXYZ(5,5,5)
				if script.Parent.Parent.Stopped.Value == 1 then
					break
				end
			end
		end)
	end
	coroutine.wrap(VXTUVGF_fake_script)()
	local function DXRLV_fake_script() -- Stop.LocalScript 
		local script = Instance.new('LocalScript', Stop)

		--Usernamesareforgeeks1#0860
		script.Parent.MouseButton1Down:Connect(function(click)
			script.Parent.Parent.Stopped.Value = 1
			script.Parent.Text = "Stopping, Please re execute the script if u want to use it again"
			wait(2)
			script.Parent.Parent:Remove()
		end)
	end
	coroutine.wrap(DXRLV_fake_script)()
	local function LGUO_fake_script() -- TextButton_2.LocalScript 
		local script = Instance.new('LocalScript', TextButton_2)

		--Usernamesareforgeeks1#0860
		script.Parent.MouseButton1Down:Connect(function(click)
			while wait() do
				local power = script.Parent.Parent.TextBox.Text
				local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
				local target = script.Parent.Parent.TextBox.Text
				p1.CFrame = game.Players[target].Character.HumanoidRootPart.CFrame
				p1.CFrame = p1.CFrame *CFrame.fromEulerAnglesXYZ(1,1,1)
				if script.Parent.Parent.Stopped.Value == 1 then
					break
				end
			end
		end)
	end
	coroutine.wrap(LGUO_fake_script)()

end)

section1.createButton("ultimate range", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yeerma/such/main/Multi-Kill'))()
	window.notification("Notice!", "hold z to turn it on (also you need a weapon like a sword or something)")
end)

section1.createButton("remove display names", function()
	local Players = game:FindService("Players")

	require(game:GetService("Chat"):WaitForChild("ClientChatModules").ChatSettings).PlayerDisplayNamesEnabled = false

	local function rename(character,name)
		repeat task.wait() until character:FindFirstChildWhichIsA("Humanoid")
		character:FindFirstChildWhichIsA("Humanoid").DisplayName = name
	end

	for i,v in next, Players:GetPlayers() do
		if v.Character then
			v.DisplayName = v.Name
			rename(v.Character,v.Name)
		end
		v.CharacterAdded:Connect(function(char)
			rename(char,v.Name)
		end)
	end

	Players.PlayerAdded:Connect(function(plr)
		plr.DisplayName = plr.Name
		plr.CharacterAdded:Connect(function(char)
			rename(char,plr.Name)
		end)
	end)
end)

section1.createButton("Energize", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/RmD3qNp7", true))()
end)

section1.createButton("Chat Art", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/omegachadgaming/mongus/main/main.lua", true))()

end)

--ADMINS

section2.createText("credit to the original creators")

section2.createButton("Simple Admin", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/3hDQcTaD'))()
end)


section2.createButton("ShatterVast Admin", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/MjmdAaq2'))();
end)


section2.createButton("Fates Admin", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
end)

section2.createButton("CMD-X", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	window.notification("fun fact", "the command 'rrleg' makes you have free korblox")

end)

section2.createButton("infyield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

section2.createButton("Homebrew Admin", function()
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"))()
end)

section2.createButton("Leg admin", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua'))()
end)

section2.createButton("Reviz Admin", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/CHMKERLC'))();
end)


--game specific

section3.createButton("Life in paradise poop script", function()
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local bind = "r" -- has to be lowercase
	mouse.KeyDown:connect(function(key)
		if key == bind then do
				local args = {
					[1] = "Turkey"
				}

				workspace.Events.Morph.Player:FireServer(unpack(args))


			end
		end
	end)
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	bind = "e" -- has to be lowercase
	mouse.KeyDown:connect(function(key)
		if key == bind then do
				-- Script generated by SimpleSpy - fixed version for exploits other than synapse & krnl made by stummy#002 credits to exx#9394 for originally creating the script.

				for _, v in next, game.Players.LocalPlayer.Character.Torso:GetDescendants() do
					if v and v:IsA"Weld" then
						v:destroy()
					end
				end
				local player = game.Players.LocalPlayer
				local mouse = player:GetMouse()
				bind = "t" -- has to be lowercase
				mouse.KeyDown:connect(function(key)
					if key == bind then do
							for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetDescendants()) do
								if v.Name == "Part" then
									v.Parent = workspace
								end
							end
						end
					end
				end)
				local player = game.Players.LocalPlayer
				local mouse = player:GetMouse()
				bind = "e" -- has to be lowercase
				mouse.KeyDown:connect(function(key)
					if key == bind then do
							for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetDescendants()) do
								if v.Name == "Mesh" then
									v:Destroy()
								end
							end
						end
					end
				end)
				while wait() do
					for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if  v.Name == "IsaMorph" then do
								v:destroy() end else end
					end
				end
			end
		end
	end)
	window.notification("Notice!", "press e to spam poop")
end)

section3.createButton("Hotel Elephant Admin V1", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Teemsploit/Epic-roblox-hack/main/HotelElephantAdminV1"))()
	window.notification("Notice!", "the prefix is ; and the cmds are ghost [plr], money [plr] [amount], ghost [plr]")
end)

section3.createButton("Naruto Roleplay (its in the name)", function()
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("Naruto Roleplay Fucker", "Serpent")


	-- MAIN
	local	 Main = Window:NewTab("Main")
	local	 MainSection = Main:NewSection("Fun")
	local	 MainSection2 = Main:NewSection("Destructive")


	MainSection:NewButton("Void Ball (Kills)", "Spawns a Void Ball that kills players upon contact.", function()
		local A_1 = 1
		local Event = game:GetService("ReplicatedStorage").void
		Event:FireServer(A_1)
	end)


	MainSection:NewButton("Black Mist", "Summon a Black Mist around your character.", function()
		local A_1 = 2
		local Event = game:GetService("ReplicatedStorage").void
		Event:FireServer(A_1)
	end)


	MainSection:NewButton("Sperm", "cum all over the fucking place idfk", function()
		local A_1 = 1
		local Event = game:GetService("ReplicatedStorage").rocke
		Event:FireServer(A_1)
	end)


	MainSection2:NewToggle("Black Mist Spam", "Spams the Black Mist around your character.", function(state)
		if state then
			_G.MistSpam = true
			while _G.MistSpam == true do
				wait()
				local A_1 = 2
				local Event = game:GetService("ReplicatedStorage").void
				Event:FireServer(A_1)
			end
		else
			_G.MistSpam = false
		end
	end)


	MainSection2:NewToggle("Sperm Spam", "cum all over the fucking place idfk", function(state)
		if state then
			_G.SusSpam = true
			while _G.SusSpam == true do
				wait()
				local A_1 = 1
				local Event = game:GetService("ReplicatedStorage").rocke
				Event:FireServer(A_1)
			end
		else
			_G.SusSpam = false
		end
	end)


	MainSection2:NewToggle("Mud Wall Spam", "Spams a Mud Wall in front of your character.", function(state)
		if state then
			_G.MudSpam = true
			while _G.MudSpam == true do
				wait()
				local A_1 = 2
				local Event = game:GetService("ReplicatedStorage").wall
				Event:FireServer(A_1)
			end
		else
			_G.MudSpam = false
		end
	end)


	MainSection2:NewToggle("Lightning Earrape", "Summons lightning to earrape nearby players.", function(state)
		if state then
			_G.Earrape = true 
			while _G.Earrape == true do
				wait()
				local A_1 = 1
				local Event = game:GetService("ReplicatedStorage").meme
				Event:FireServer(A_1)
			end
		else
			_G.Earrape = false
		end
	end)


	MainSection2:NewButton("Crash Server", "Summons frogs to crash the server.", function()
		while task.wait() do
			for i = 1,10 do
				local A_1 = 2
				local Event = game:GetService("ReplicatedStorage").meme
				Event:FireServer(A_1)
			end
		end 
	end)


	-- CREDITS
	local Credit = Window:NewTab("Credits")
	local CreditSection = Credit:NewSection("Made by nu7#3943")
	CreditSection:NewLabel("Kavo UI Library by xHeptc")
end)

