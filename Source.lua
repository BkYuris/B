game.StarterGui:SetCore("SendNotification", {
Title = "Script",
Text = "Admin Command Has Loaded",
Duration = 3
})
local States = {}
local LoopKill = {}

function Split(Arguaments, Split)
if not Arguaments or not Split then return end
return Arguaments:split(Split)
end

local function GetPos()
return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end

local function GetCamPos()
return workspace.CurrentCamera.CFrame
end

local function GetTeam()
return game.Players.LocalPlayer.TeamColor.Name
end

--[[workspace.Remote.TeamEvent:FireServer("Medium stone grey")
local savedcamcf = GetCamPos()
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new("Bright black").Name)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
workspace.CurrentCamera.CFrame = savedcamcf]]

local BuyGamepass = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(tonumber((game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')[#((game:GetService("Players").LocalPlayer.CharacterAppearance):split('='))]), 96651)

local function GetPlayer(String)
if not String then return end
local Yes = {}
for _, Player in ipairs(game.Players:GetPlayers()) do
if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
table.insert(Yes, Player)
end
end
if #Yes > 0 then
return Yes[1]
elseif #Yes < 1 then
return nil
end
end

function Chat(Message, Whisper)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, Whisper or "ALl")
end

function WaitForChild(Time, Parent, Child)
if not Parent or not Child then return end
if Parent == "LocalPlayer" then Parent = game.Players.LocalPlayer end
if Parent == "Character" then Parent = game.Players.LocalPlayer.Character end
if Parent == "Backpack" then Parent = game.Players.LocalPlayer.Character.Backpack end
local Times = Time * 10 or 1
repeat wait(.1)
Time = Time - 1
until Parent:FindFirstChild(Child) or Time <= 0
if Parent and Parent:FindFirstChild(Child) then
return Parent:FindFirstChild(Child)
else
return nil
end
end

function Kill(Player)
pcall(function()
if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

local MyTeam = GetTeam()
if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
local savedcf = GetPos()
local savedcamcf = GetCamPos()
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
workspace.CurrentCamera.CFrame = savedcamcf
workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
end

local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")

local FireEvent = {
[1] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [2] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [3] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [4] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [5] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [6] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [7] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}, [8] = {
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Head
}
}

game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
Gun.Parent = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
end)
end

function Tase(Player)
if Player.TeamColor.Name == "Bright blue" or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
pcall(function()
local savedcf = GetPos()
local savedteam

local Gun = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") or game.Players.LocalPlayer.Character:FindFirstChild("Taser")

local changedteam = false
if game.Players.LocalPlayer.TeamColor.Name ~= "Bright blue" or not Gun then
savedteam = GetTeam()
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new("Bright blue").Name)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
changedteam = true
end

local Guns = game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") or game.Players.LocalPlayer.Character:FindFirstChild("Taser")

local TaseEvent = 
{
[1] = 
{
["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
["Distance"] = 0, 
["Cframe"] = CFrame.new(), 
["Hit"] = workspace[Player.Name].Torso
}
}

game:GetService("ReplicatedStorage").ShootEvent:FireServer(TaseEvent, Guns)
if changedteam then
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(savedteam).Name)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
end
end)
end

function Arrest(Player, Time)
local Time = Time or 1
local savedcf = GetPos()
local savedcamcf = GetCamPos()
local savedteam = GetTeam()
if Player then
repeat wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
for i = 1,Time do
coroutine.wrap(function()
workspace.Remote.arrest:InvokeServer(Player.Character.Head)
end)()
end
until Player.Character:FindFirstChild("Head"):FindFirstChild("handcuffedGui")
wait()
end
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(savedteam).Name)
game.Players.LocalPlayer.Character.Humanoid.Sit = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
workspace.CurrentCamera.CFrame = savedcamcf
end
function Arrest(Player, Time)
local Time = Time or 1
local savedcf = GetPos()
local savedcamcf = GetCamPos()
local savedteam = GetTeam()
if Player then
repeat wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
for i = 1,Time do
coroutine.wrap(function()
workspace.Remote.arrest:InvokeServer(Player.Character.Head)
end)()
end
until Player.Character:FindFirstChild("Head"):FindFirstChild("handcuffedGui")
wait()
end
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(savedteam).Name)
game.Players.LocalPlayer.Character.Humanoid.Sit = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
workspace.CurrentCamera.CFrame = savedcamcf
end

function DetectMove(Player)
local oldpos = Player.Character.HumanoidRootPart.CFrame
local Move
local Time = 0
repeat wait(.1)
Time = Time + 1
if oldpos ~= Player.Character.HumanoidRootPart.CFrame then
Move = true
else
Move = false
end
until (Time >= 500 and Move == false) or Move == true
return Move
end

function Teleport(Player, Position)
	if Player == nil or Position == nil then return end
	local savedcf = GetPos()
	workspace.Remote.loadchar:InvokeServer()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
	local CHAR = game.Players.LocalPlayer.Character
	CHAR.Humanoid.Name = "1"
	local c = CHAR["1"]:Clone()
	c.Name = "Humanoid"
	c.Parent = CHAR
	CHAR["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = CHAR
	CHAR.Animate.Disabled = true
	wait()
	CHAR.Animate.Disabled = false
	CHAR.Humanoid.DisplayDistanceType = "None"
	game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9").Parent = CHAR
	local STOP = 0
	repeat wait(.1)
		STOP = STOP + 1
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.75)
	until (not game.Players.LocalPlayer.Character:FindFirstChild("M9") or not game.Players.LocalPlayer.Character.HumanoidRootPart or not Player.Character.HumanoidRootPart or not game.Players.LocalPlayer.Character.HumanoidRootPart.Parent or not Player.Character.HumanoidRootPart.Parent or STOP > 500) and STOP > 3
	local STOP_2 = 0
	repeat wait()
		STOP_2 = STOP_2 + 1
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
	until STOP_2 > 10
	workspace.Remote.loadchar:InvokeServer()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
end

function TeleportV(Player, Player2)
	if Player == nil or Player2 == nil then return end
	local savedcf = GetPos()
	workspace.Remote.loadchar:InvokeServer()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
	local CHAR = game.Players.LocalPlayer.Character
	CHAR.Humanoid.Name = "1"
	local c = CHAR["1"]:Clone()
	c.Name = "Humanoid"
	c.Parent = CHAR
	CHAR["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = CHAR
	CHAR.Animate.Disabled = true
	wait()
	CHAR.Animate.Disabled = false
	CHAR.Humanoid.DisplayDistanceType = "None"
	game.Players.LocalPlayer:FindFirstChild("Backpack"):FindFirstChild("M9").Parent = CHAR
	local STOP = 0
	repeat wait(.1)
		STOP = STOP + 1
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.75)
	until (not game.Players.LocalPlayer.Character:FindFirstChild("M9") or not game.Players.LocalPlayer.Character.HumanoidRootPart or not Player.Character.HumanoidRootPart or not game.Players.LocalPlayer.Character.HumanoidRootPart.Parent or not Player.Character.HumanoidRootPart.Parent or STOP > 500) and STOP > 3
	local STOP_2 = 0
	repeat wait()
		STOP_2 = STOP_2 + 1
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player2.Character.HumanoidRootPart.CFrame
	until STOP_2 > 10
	workspace.Remote.loadchar:InvokeServer()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
end

function ArrestEvent(Player, Time)
	for i = 1,Time do
		workspace.Remote.arrest:InvokeServer(Player.Character.Head)
	end
end

function Rank(Message)
local ArgR2 = Message:split(" ")[2]
if rank == unrank then
end
if not rank == unrank then
if Message == ":cmds" then
Chat("/w "..Player.Name.." Command List :kill all :kill [plrs] :tase all :tase [plrs] :loopkill [plrs] :unloopkill [plrs] :makecrim all :makecrim [plrs]")
end
if Message == ":kill "..ArgR2.."" then
Kill(GetPlayer(ArgR2))
end
if Message == ":kill all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Kill(v)
end
end
end
if Message == ":tase "..ArgR2.."" or Message == ":taser "..ArgR2.."" then
Tase(GetPlayer(ArgR2))
end
if Message == ":tase all" or Message == ":taser all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Tase(v)
end
end
end
if Message == ":killaura" then
coroutine.wrap(function()
	while wait() do
			for i,v in pairs(game.Players:GetPlayers()) do
				pcall(function()
					if v ~= game.Players.LocalPlayer then
						local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
						if Distance <= 10 then
							for i = 1,25 do
								game.ReplicatedStorage.meleeEvent:FireServer(v)
							end
						end
					end
				end)
			end
		end
end)()

end
if Message == ":unkillaura" then
coroutine.wrap(function()
	while wait() do
			for i,v in pairs(game.Players:GetPlayers()) do
				pcall(function()
					if v ~= game.Players.LocalPlayer then
						local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
						if Distance <= 10 then
							for i = 1,0 do
								game.ReplicatedStorage.meleeEvent:FireServer(v)
							end
						end
					end
				end)
			end
		end
end)()

end
if Message == ":loopkill "..ArgR2.."" or Message == ":lk "..ArgR2.."" then
local Player = GetPlayer(ArgR2)
		if Player ~= nil and not LoopKill[Player.UserId] then
			LoopKill[Player.UserId] = {Player = Player}
			end
end
if Message == ":unloopkill "..ArgR2R.."" or Message == ":unlk "..ArgR2.."" then
local Player = GetPlayer(ArgR2)
		if Player ~= nil and LoopKill[Player.UserId] then
			LoopKill[Player.UserId] = nil
			end
end
if Message == ":makecrim "..ArgR2.."" or Message == ":makecriminal "..ArgR2.."" then
Teleport(GetPlayer(ArgR2), CFrame.new(-919, 96, 2138))
end
if Message == ":makecrim all" or Message == ":makecriminal all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Teleport(v, CFrame.new(-919, 96, 2138))
end end
end
end
end

function FeGodMode()
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
end

function Cmds(Message)
local Arg2 = Message:split(" ")[2]
if Message == ";setspeed "..Arg2.."" then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Arg2
end
if Message == ";resetspeed" then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end
if Message == ";gun" or Message == ";giveguns" or Message == ";guns" then
if BuyGamepass then
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
		else
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
		end
end
if Message == ";kill "..Arg2.."" then
Kill(GetPlayer(Arg2))
end
if Message == ";kill all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Kill(v)
end
end
end
if Message == ";loopkill "..Arg2.."" or Message == ";lk "..Arg2.."" then
local Player = GetPlayer(Arg2)
		if Player ~= nil and not LoopKill[Player.UserId] then
			LoopKill[Player.UserId] = {Player = Player}
			end
end
if Message == ";unloopkill "..Arg2.."" or Message == ";unlk "..Arg2.."" then
local Player = GetPlayer(Arg2)
		if Player ~= nil and LoopKill[Player.UserId] then
			LoopKill[Player.UserId] = nil
			end
end
if Message == ";tase "..Arg2.."" or Message == ";taser "..Arg2.."" then
Tase(GetPlayer(Arg2))
end
if Message == ";tase all" or Message == ";taser all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Tase(v)
end
end
end
if Message == ";rank "..Arg2.."" then
local Player = GetPlayer(Arg2)
if Player ~= nil then
local rank = Player
Chat("/w "..Player.Name.." You've got admin permissions! Type :cmds or to see all commands")
Player.Chatted:Connect(Rank)
end
end
if Message == ";unrank "..Arg2.."" then
local Player = GetPlayer(Arg2)
if Player ~= nil then
local unrank = Player
Chat("/w "..Player.Name.." Sorry i remove your admin permission!")
Player.Chatted:Connect(Rank)
end
end
if Message == ";makecrim "..Arg2.."" or Message == ";makecriminal "..Arg2.."" then
Teleport(GetPlayer(Arg2), CFrame.new(-919, 96, 2138))
end
if Message == ";makecrim all" or Message == ";makecriminal all" then
for i,v in pairs(game.Players:GetPlayers()) do
if v ~= game.Players.LocalPlayer then
Teleport(v, CFrame.new(-919, 96, 2138))
end end
end
if Message == ";killaura" then
coroutine.wrap(function()
	while wait() do
			for i,v in pairs(game.Players:GetPlayers()) do
				pcall(function()
					if v ~= game.Players.LocalPlayer then
						local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
						if Distance <= 10 then
							for i = 1,25 do
								game.ReplicatedStorage.meleeEvent:FireServer(v)
							end
						end
					end
				end)
			end
		end
end)()

end
if Message == ";unkillaura" then
coroutine.wrap(function()
	while wait() do
			for i,v in pairs(game.Players:GetPlayers()) do
				pcall(function()
					if v ~= game.Players.LocalPlayer then
						local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
						if Distance <= 10 then
							for i = 1,0 do
								game.ReplicatedStorage.meleeEvent:FireServer(v)
							end
						end
					end
				end)
			end
		end
end)()

end
if Message == ";neutral" then
workspace.Remote.TeamEvent:FireServer("Medium stone grey")
end
if Message == ";arrest "..Arg2.."" then
Arrest(GetPlayer(Arg2))
end
if Message == ";goto "..Arg2.."" then
TeleportV(GetPlayer(Arg2), game.Players.LocalPlayer)
end
if Message == ";bring "..Arg2.."" then
TeleportV(game.Players.LocalPlayer, GetPlayer(Arg2))
end
if Message == ";god" or Message == ";godmode" then
while wait() do
game.Players.LocalPlayer.Character.Humanoid.Name = 1
local l = game.Players.LocalPlayer.Character["1"]:Clone()
l.Parent = game.Players.LocalPlayer.Character
l.Name = "Humanoid"
game.Players.LocalPlayer.Character.Animate.Disabled = true
wait()
game.Players.LocalPlayer.Character.Animate.Disabled = false
game.Players.LocalPlayer.Character["1"]:Destroy()
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
wait(5)
local savedcf = GetPos()
local savedcamcf = GetCamPos()
local savedteam = GetTeam()
workspace.Remote.loadchar:InvokeServer(nil, BrickColor.new(savedteam).Name)
workspace.CurrentCamera.CFrame = savedcamcf
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
FeGodMode()
end
end
end

spawn(function()
	while wait() do
		for i,v in pairs(LoopKill) do
			pcall(function()
				if v.Player and v.Player.Character and v.Player.Character.Head and v.Player.Character.Humanoid.Health ~= 0 then
					Kill(v.Player)
				end
			end)
		end
	end
end)

game.Players.LocalPlayer.Chatted:Connect(Cmds)
