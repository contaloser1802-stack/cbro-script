--[[
       _            
  __ _| | ___  _ __ __ _ 
 / _` | |/ _ \| '__/ _` |
| (_| | | (_) | | | (_| |
 \__,_|_|\___/|_|  \__,_|  

astrixsete, a free and open source Counter Blox script created by sjors

--]]
repeat wait() until game:IsLoaded()

if game:GetService("CoreGui"):FindFirstChild("sjorlib") then return end
getgenv().error = function() end
local ver = "1.0.1"
--files
if not isfolder("astrixsete") then
    makefolder("astrixsete")
end
if not isfolder("astrixsete/"..tostring(game.GameId)) then
    makefolder("astrixsete/"..tostring(game.GameId))
end
--vars
-- LINHA CORRIGIDA ABAIXO
local library,menu,tabholder = loadstring(game:HttpGet("https://raw.githubusercontent.com/sj0rs1/alora/main/library.lua"))()
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local lighting = game:GetService("Lighting")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = localPlayer:GetMouse()
local debris = game:GetService("Debris")
local client = getsenv(localPlayer.PlayerGui.Client)

local astrixseteWatermark = Drawing.new("Text");astrixseteWatermark.Font = Drawing.Fonts.Plex;astrixseteWatermark.Position = Vector2.new(50,24);astrixseteWatermark.Visible = false;astrixseteWatermark.Size = 16;astrixseteWatermark.Color = Color3.new(1,1,1);astrixseteWatermark.Outline = true
local speclistText = Drawing.new("Text");speclistText.Font = Drawing.Fonts.Plex;speclistText.Position = Vector2.new(8,305);speclistText.Visible = false;speclistText.Size = 16;speclistText.Color = Color3.new(1,1,1);speclistText.Outline = true

local skyboxes = {
    ["Purple Nebula"] = {
        ["SkyboxBk"] = "rbxassetid://159454299",
        ["SkyboxDn"] = "rbxassetid://159454296",
        ["SkyboxFt"] = "rbxassetid://159454293",
        ["SkyboxLf"] = "rbxassetid://159454286",
        ["SkyboxRt"] = "rbxassetid://159454300",
        ["SkyboxUp"] = "rbxassetid://159454288"
    },
    ["Night Sky"] = {
        ["SkyboxBk"] = "rbxassetid://12064107",
        ["SkyboxDn"] = "rbxassetid://12064152",
        ["SkyboxFt"] = "rbxassetid://12064121",
        ["SkyboxLf"] = "rbxassetid://12063984",
        ["SkyboxRt"] = "rbxassetid://12064115",
        ["SkyboxUp"] = "rbxassetid://12064131"
    },
    ["Pink Daylight"] = {
        ["SkyboxBk"] = "rbxassetid://271042516",
        ["SkyboxDn"] = "rbxassetid://271077243",
        ["SkyboxFt"] = "rbxassetid://271042556",
        ["SkyboxLf"] = "rbxassetid://271042310",
        ["SkyboxRt"] = "rbxassetid://271042467",
        ["SkyboxUp"] = "rbxassetid://271077958"
    },
    ["Morning Glow"] = {
        ["SkyboxBk"] = "rbxassetid://1417494030",
        ["SkyboxDn"] = "rbxassetid://1417494146",
        ["SkyboxFt"] = "rbxassetid://1417494253",
        ["SkyboxLf"] = "rbxassetid://1417494402",
        ["SkyboxRt"] = "rbxassetid://1417494499",
        ["SkyboxUp"] = "rbxassetid://1417494643"
    },
    ["Setting Sun"] = {
        ["SkyboxBk"] = "rbxassetid://626460377",
        ["SkyboxDn"] = "rbxassetid://626460216",
        ["SkyboxFt"] = "rbxassetid://626460513",
        ["SkyboxLf"] = "rbxassetid://626473032",
        ["SkyboxRt"] = "rbxassetid://626458639",
        ["SkyboxUp"] = "rbxassetid://626460625"
    },
    ["Fade Blue"] = {
        ["SkyboxBk"] = "rbxassetid://153695414",
        ["SkyboxDn"] = "rbxassetid://153695352",
        ["SkyboxFt"] = "rbxassetid://153695452",
        ["SkyboxLf"] = "rbxassetid://153695320",
        ["SkyboxRt"] = "rbxassetid://153695383",
        ["SkyboxUp"] = "rbxassetid://153695471"
    },
    ["Elegant Morning"] = {
        ["SkyboxBk"] = "rbxassetid://153767241",
        ["SkyboxDn"] = "rbxassetid://153767216",
        ["SkyboxFt"] = "rbxassetid://153767266",
        ["SkyboxLf"] = "rbxassetid://153767200",
        ["SkyboxRt"] = "rbxassetid://153767231",
        ["SkyboxUp"] = "rbxassetid://153767288"
    },
    ["Neptune"] = {
        ["SkyboxBk"] = "rbxassetid://218955819",
        ["SkyboxDn"] = "rbxassetid://218953419",
        ["SkyboxFt"] = "rbxassetid://218954524",
        ["SkyboxLf"] = "rbxassetid://218958493",
        ["SkyboxRt"] = "rbxassetid://218957134",
        ["SkyboxUp"] = "rbxassetid://218950090"
    },
    ["Redshift"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
    ["Aesthetic Night"] = {
        ["SkyboxBk"] = "rbxassetid://1045964490",
        ["SkyboxDn"] = "rbxassetid://1045964368",
        ["SkyboxFt"] = "rbxassetid://1045964655",
        ["SkyboxLf"] = "rbxassetid://1045964655",
        ["SkyboxRt"] = "rbxassetid://1045964655",
        ["SkyboxUp"] = "rbxassetid://1045962969"
    }
}

local hitsounds = {
    Bameware = "rbxassetid://3124331820",
    Bell = "rbxassetid://6534947240",
    Bubble = "rbxassetid://6534947588",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Minecraft = "rbxassetid://4018616850"
}

local hitboxList = {
    Head = {"Head"},
    Torso = {"UpperTorso","LowerTorso"},
    Arms = {"LeftLowerArm","RightLowerArm","LeftHand","RightHand"},
    Legs = {"LeftLowerLeg","RightLowerLeg"}
}

local aimbotActive = false -- Variável para rastrear o estado do Toggle
local unlockInventory,unlocked = false,false
local skins = {{"TKnife_Stock"},{"CTKnife_Stock"},{"TGlove_Stock"},{"CTGlove_Stock"}}
local btInfo = {parent = nil,folder = nil}
local preventBt = false
local silentPart = nil
local hookJp = nil
local hookWs = nil
local timeout = 0
local meta = getrawmetatable(game)
setreadonly(meta,false)
local oldNamecall = meta.__namecall
local oldNewindex = meta.__newindex

--functions
function encodePos(pos)
    return Vector3.new(((pos.X - 74312) * 4 + 1325) * 13,(pos.Y + 3183421) * 4 - 4201432,(pos.Z * 41 - 581357) * 2)
end

function decodePos(encodedPos)
    return Vector3.new(((encodedPos.X / 13 - 1325) / 4) + 74312,((encodedPos.Y + 4201432) / 4) - 3183421,((encodedPos.Z / 2 + 581357) / 41))
end

function isAlive(plr)
    if not plr then plr = localPlayer end
    return plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Head") and plr.Character.Humanoid.Health > 0 and true or false
end

function hasProperty(ins,pro)
    return pcall(function() _=ins[pro] end)
end

function getWeaponInfo()
    local information = {
        alive = isAlive()
    }
    if not information.alive then return information end
    if replicatedStorage.Weapons:FindFirstChild(localPlayer.Character.EquippedTool.Value) then
        local weapType = "other"
        local hitboxes = {}
        local weapon = replicatedStorage.Weapons[localPlayer.Character.EquippedTool.Value]
        if weapon:FindFirstChild("RifleThing") then
            weapType = "rifle"
        elseif weapon:FindFirstChild("Secondary") and weapon.Name ~= "R8" and weapon.Name ~= "DesertEagle" then
            weapType = "pistol"
        elseif weapon.Name == "R8" or weapon.Name == "DesertEagle" then
            weapType = "heavyp"
        elseif weapon.Name == "AWP" then
            weapType = "awp"
        elseif weapon.Name == "Scout" then
            weapType = "scout"
        end

        for i,v in next, library.flags[weapType.."_hitboxes"] do
            for _i,_v in next, hitboxList[v] do
                table.insert(hitboxes,_v)
            end
        end

        information["name"] = weapon.Name
        information["melee"] = false
        information["aim_assist"] = library.flags[weapType.."_assist"]
        information["silent_aim"] = library.flags[weapType.."_silent"]
        information["triggerbot"] = library.flags[weapType.."_triggerbot"]
        information["assist_fov"] = library.flags[weapType.."_assist_fov"]
        information["silent_fov"] = library.flags[weapType.."_silent_fov"]
        information["smoothness"] = library.flags[weapType.."_assist_smoothness"]
        information["trigger_delay"] = library.flags[weapType.."_triggerdelay"]
        information["hitboxes"] = hitboxes
    end
    return information
end

function teamCheck(plr,team)
    return plr ~= localPlayer and team or plr.Team ~= localPlayer.Team
end

function getNearest(visOnly,team)
    local player,nearest = nil,9e9
    for i,v in next, players:GetPlayers() do
        if teamCheck(v,team) and isAlive(v) then
            if visOnly then
                local ray = Ray.new(camera.CFrame.p,(v.Character.Head.Position - camera.CFrame.p).unit * 500)
                local hit,_ = workspace:FindPartOnRayWithIgnoreList(ray, {camera,localPlayer.Character,workspace.Ray_Ignore,workspace.Map.Clips,workspace.Map.SpawnPoints})
                if hit and hit:IsDescendantOf(v.Character) then else continue end
            end
            local screenPos,onScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local magnitude = (Vector2.new(screenPos.X,screenPos.Y)-Vector2.new(mouse.X,mouse.Y)).magnitude
            if onScreen and magnitude < nearest then
                player = v
                nearest = magnitude
            end
        end
    end
    return player,nearest
end

local lastKeybindState = false -- Variável auxiliar para o Toggle
function checkAimbotActivation()
    local key = library.flags["aimbot_keybind"]
    local mode = library.flags["aimbot_mode"]
    local keyIsDown = isButtonDown(key)

    if mode == "Always" then
        return true
    elseif mode == "Hold" then
        return keyIsDown
    elseif mode == "Toggle" then
        if keyIsDown and not lastKeybindState then -- Verifica se a tecla foi Pressionada (rising edge)
            aimbotActive = not aimbotActive
        end
        lastKeybindState = keyIsDown -- Atualiza o estado da tecla para o próximo frame
        return aimbotActive
    end

    return false
end

function isButtonDown(key)
    if string.find(tostring(key),"KeyCode") then
        return userInputService:IsKeyDown(key) 
    else
        for _,v in pairs(userInputService:GetMouseButtonsPressed()) do
            if v.UserInputType == key then
                return true
            end
        end
    end
	return false
end

function updateSkybox()
    if lighting:FindFirstChild("customsky") then
        lighting.customsky:Destroy()
    end
    if lighting:FindFirstChild("SunRays") then
        lighting.SunRays.Enabled = false
    end
    local customsky = Instance.new("Sky",lighting)
    customsky.Name = "customsky"
    customsky.SunTextureId = "rbxassetid://"
    customsky.CelestialBodiesShown = "rbxassetid://"
    if library.flags["skybox_changer"] and skyboxes[library.flags["selected_skybox"]] then
        for i,v in next, skyboxes[library.flags["selected_skybox"]] do
            customsky[i] = v
        end
    end
end

local tracerDebounce = false
function createTracer(to,from)
    if not tracerDebounce then
        tracerDebounce = true
        spawn(function()
            wait()
            tracerDebounce = false
        end)
        to -= (from.Position - to).unit*100
        local part1 = Instance.new("Part")
        local part2 = Instance.new("Part")
        local beam = Instance.new("Beam",part1)
        local beam2 = Instance.new("Beam",part1)
        local attachment1 = Instance.new("Attachment")
        local attachment2 = Instance.new("Attachment")

        part1.Transparency = 1;part1.Position = to;part1.CanCollide = false;part1.Anchored = true;part1.Parent = workspace.Debris;attachment1.Parent = part1
        part2.Transparency = 1;part2.Position = from.Position;part2.CanCollide = false;part2.Anchored = true;part2.Parent = workspace.Debris;attachment2.Parent = part2
        beam.FaceCamera = true;beam.Color = ColorSequence.new(library.flags["tracer_color"]);beam.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-0.5),NumberSequenceKeypoint.new(1,1-0.5)};beam.Width0 = 0.055;beam.Width1 = 0.055;beam.LightEmission = 1;beam.LightInfluence = 0;beam.Attachment0 = attachment1;beam.Attachment1 = attachment2;beam.Parent = part1
        beam2.FaceCamera = true;beam2.Color = ColorSequence.new(Color3.new(1,1,1));beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-0.75),NumberSequenceKeypoint.new(1,1-0.75)};beam2.Width0 = 0.025;beam2.Width1 = 0.025;beam2.LightEmission = 1;beam2.LightInfluence = 0;beam2.Attachment0 = attachment1;beam2.Attachment1 = attachment2;beam2.Parent = part1
        
        spawn(function()
            wait(2)
            for i=0.5,0,-0.025 do wait()
                beam.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-i),NumberSequenceKeypoint.new(1,1-i)}
                beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,(0.75)-i),NumberSequenceKeypoint.new(1,(0.75)-i)}
            end
            for i=0.25,0,-0.025 do wait()
                beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-i),NumberSequenceKeypoint.new(1,1-i)}
            end
            beam:Destroy()
            beam2:Destroy()
        end)
    end
end

oldSounds = {}
for i,v in next, localPlayer.PlayerGui.Music:GetDescendants() do -- this is MY CODE!!!
	if v:IsA("Sound") then
		if v.Name == "Lose" then
			oldSounds["Lose"] = v.SoundId
		elseif v.Name == "Win" then
			oldSounds["Win"] = v.SoundId
		elseif v.Name == "Bomb" then
			oldSounds["Bomb"]= v.SoundId
		elseif v.Name == "1" then
			if v.Parent.Name == "StartRound" then
				oldSounds["StartRound"] = v.SoundId
			end
		end
	end
end

local espObjects = {}
function createEsp(plr)
    if plr == localPlayer then return end
    local textDropShadowESP = Drawing.new("Text")
    local textESP = Drawing.new("Text")
    local boxESP = Drawing.new("Square")
    local boxoutlineESP = Drawing.new("Square")
    local boxinlineESP = Drawing.new("Square")
    local healthbarESPoutline = Drawing.new("Square")
    local healthbarESP = Drawing.new("Square")

    textESP.Font = Drawing.Fonts.Plex
    textESP.Size = 16
    textESP.Color = Color3.new(1,1,1)
    textESP.OutlineColor = Color3.new(0,0,0)
    textESP.Transparency = 1

    textDropShadowESP.Font = Drawing.Fonts.Plex
    textDropShadowESP.Size = 16
    textDropShadowESP.Color = Color3.new(0,0,0)
    textDropShadowESP.OutlineColor = Color3.new(0,0,0)
    textDropShadowESP.Transparency = 1

    boxESP.Thickness = 1
    boxESP.Color = Color3.new(1,1,1)
    boxESP.Transparency = 1

    boxoutlineESP.Thickness = 1
    boxoutlineESP.Color = Color3.new(0,0,0)
    boxoutlineESP.Transparency = 1

    boxinlineESP.Thickness = 1
    boxinlineESP.Color = Color3.new(0,0,0)
    boxinlineESP.Transparency = 1
    
    healthbarESP.Thickness = 1
    healthbarESP.Color = Color3.fromRGB(50,220,50)
    healthbarESP.Transparency = 1

    healthbarESPoutline.Thickness = 1
    healthbarESPoutline.Color = Color3.new(0,0,0)
    healthbarESPoutline.Transparency = 1
    healthbarESPoutline.Filled = true

    function invis()
        textESP.Visible = false
        textDropShadowESP.Visible = false
        boxESP.Visible = false
        boxoutlineESP.Visible = false
        boxinlineESP.Visible = false
        healthbarESPoutline.Visible = false
        healthbarESP.Visible = false
    end

    function remove()
        textESP:Remove()
        textDropShadowESP:Remove()
        boxESP:Remove()
        boxoutlineESP:Remove()
        healthbarESP:Remove()
        boxinlineESP:Remove()
        healthbarESPoutline:Remove()
        healthbarESP:Remove()
        espObjects[plr.Name] = nil
    end

    local espList = {
        text = textESP,
        textshadow = textDropShadowESP,
        box = boxESP,
        boxol = boxoutlineESP,
        boxil = boxinlineESP,
        healthb = healthbarESP,
        healthbo = healthbarESPoutline,

        invis = invis,
        remove = remove,
    }
    espObjects[plr.Name] = espList
end

function getOffsets(x,y,minY,z)
    return {CFrame.new(x,y,z),CFrame.new(-x,y,z),CFrame.new(x,y,-z),CFrame.new(-x,y,-z),CFrame.new(x,-minY,z),CFrame.new(-x,-minY,z),CFrame.new(x,-minY,-z),CFrame.new(-x,-minY,-z)}
end

function floor(val)
    return Vector2.new(math.floor(val.X),math.floor(val.Y))
end

function updateViewmodel()
    if camera:FindFirstChild("Arms") then
        local arms = camera.Arms
        for i,v in next, arms:GetChildren() do
            if library.flags["weapon_chams"] then
                if (v:IsA("MeshPart") or v.Name == "Part") and v.Transparency ~= 1 then
                    if v.Name == "StatClock" then v:ClearAllChildren() end
                    v.Color = library.flags["weapon_color"]
                    v.Transparency = library.flags["weapon_trans"]/100
                    v.Material = "SmoothPlastic"
                    if hasProperty(v,"TextureID") then v.TextureID = "" end
                end
            end
            if v:IsA"Model" then
                for _i,_v in next, v:GetDescendants() do
                    if library.flags["remove_sleeves"] and _v.Name == "Sleeve" then
                        _v:Destroy()
                    end
                    if library.flags["arm_chams"] then
                        if hasProperty(_v,"CastShadow") then _v.CastShadow = false end
                        if _v:IsA"SpecialMesh" then
                            local clr = library.flags["arm_color"]
                            _v.VertexColor = Vector3.new(clr.R,clr.G,clr.B)
                        end
                        if _v:IsA"Part" then
                            _v.Material = "SmoothPlastic"
                            _v.Transparency = library.flags["arm_trans"]/100
                            _v.Color = library.flags["arm_color"]
                            if _v.Transparency == 1 then continue end
                        end
                    end
                end
            end
        end
    end
end

for i,v in pairs(localPlayer.PlayerGui.Client.Rarities:GetChildren()) do
    table.insert(skins,{v.Name})
end

meta.__newindex = newcclosure(function(self,idx,val)
    if idx == "JumpPower" and hookJp then
        val = 22
    end
    return oldNewindex(self,idx,val)
end)

meta.__namecall = newcclosure(function(self,...)
    local argsCount = select("#", ...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "Kick" then 
        return 
    end
    if self.Name == "RemoteEvent" and typeof(args[1]) == "table" and args[1][1] == "kick" then
        return
    end
    if self.Name == "FallDamage" and library.flags["fall_damage"] then
        return
    end
    if self.Name == "BURNME" and library.flags["fire_damage"] then
        return
    end
    if method == "InvokeServer" and self.Name == "Hugh" then
        return
    end

    if string.find(method,"IgnoreList") and silentPart then
        args[1] = Ray.new(camera.CFrame.p, (silentPart.Position + Vector3.new(0,(camera.CFrame.p-silentPart.Position).Magnitude/500,0) - camera.CFrame.p).unit * 500)
    end

    if method == "SetPrimaryPartCFrame" and library.flags["viewmodel_changer"] then
        args[1] *= CFrame.new((library.flags["viewmodel_x"]-20)/10,(library.flags["viewmodel_y"]-20)/10,(library.flags["viewmodel_z"]-20)/10)
    end

    if method == "FireServer" then
        if args[1] == localPlayer.UserId or string.find(tostring(args[1]),'{') then
            return
        end
        if not btInfo.parent and self.Name == "RemoteEvent" and tostring(args[1][3]) == "btp" then
            btInfo.parent = args[1][3].read.Value
            btInfo.folder = args[1][3].Parent
            spawn(function()
                wait()
                btInfo.parent = nil
            end)
            return
        end
        if self.Name == "ApplyGun" then
            if string.find(args[1],"Banana") or string.find(args[1],"Flip") then 
                args[1] = localPlayer.Status.Team.Value.." Knife"
            end
        end
        if self.Name == "HitPart" then
            if timeout > 0 then
                return
            end
            if string.find(string.lower(args[1].Name),"head") then
                timeout = 7
            end
            spawn(function()
                local hitplayer = players:FindFirstChild(args[1].Parent.Name)
                if hitplayer then
                    preventBt = true
                    wait()
                    preventBt = false
                end
                if library.flags["hitsound_enabled"] and hitplayer and teamCheck(hitplayer,false) then
                    local hitsound = Instance.new("Sound",workspace)
                    hitsound.SoundId = hitsounds[library.flags["hitsound_value"]]
                    hitsound.PlayOnRemove = true
                    hitsound.Volume = library.flags["hitsound_volume"]
                    hitsound:Destroy()
                end
                if library.flags["bullet_tracer"] and localPlayer.Character and  camera:FindFirstChild("Arms") then
                    local from = camera.Arms:FindFirstChild("Flash")
                    if from then
                        createTracer(decodePos(args[2]),from)
                    end
                end
            end)
            if btInfo.parent and not preventBt then
                args[1] = btInfo.parent.Head
                args[2] = encodePos(args[1].Position)
                timeout = 7
                btInfo.parent = nil
                spawn(function()
                    btInfo.folder:ClearAllChildren()
                end)
            end
        end
        if unlockInventory then
            if #self.Name == 38 then
                if not unlocked then
                    unlocked = true
                    for i,v in next, skins do
                        local doSkip
                        for _i,_v in next, args[1] do
                            if v[1] == _v[1] then
                                doSkip = true
                            end
                        end
                        if not doSkip then
                            table.insert(args[1], v)
                        end
                    end
                end
                return
            end
            if self.Name == "DataEvent" and args[1][4] then
                local currentSkin = string.split(args[1][4][1],"_")[2]
                local name = args[1][3]
                if args[1][2] == "Both" then
                    localPlayer["SkinFolder"]["CTFolder"][name].Value = currentSkin
                    localPlayer["SkinFolder"]["TFolder"][name].Value = currentSkin
                else
                    localPlayer["SkinFolder"][args[1][2].."Folder"][name].Value = currentSkin
                end
            end
        end   
    end
    return oldNamecall(self, table.unpack(args, 1, argsCount))
end)

-- local firebullet = client.firebullet
-- client.firebullet = function(self,...)
-- 	if not menu.Enabled then
-- 		firebullet(self,...)
-- 	end
-- end

local aimbotTab = library:addTab("Aimbot")
local visualsTab = library:addTab("Visuals")
local miscTab = library:addTab("Misc")
local configTab = library:addTab("Settings")

local configGroup = configTab:createGroup(0)
configGroup:addColorpicker({text = "Menu Accent",flag = "menu_accent",ontop = true,color = Color3.fromRGB(100,60,80),callback = function(val)
    for i,v in next, tabholder:GetDescendants() do
        pcall(function()
            if v.Name ~= "dontchange" and v.BackgroundColor3 == library.libColor then
                v.BackgroundColor3 = val
            end
        end)
    end
    library.libColor = val
end})
configGroup:addList({text = "Config",flag = "selected_config",skipflag = true,values = {}})
configGroup:addTextbox({text = "config name",flag = "config_name"})
configGroup:addButton({text = "Save Config",callback = library.saveConfig})
configGroup:addButton({text = "Load Config",callback = library.loadConfig})
configGroup:addButton({text = "Delete Config",callback = library.deleteConfig})
configGroup:addButton({text = "Refresh Configs",callback = library.refreshConfigs})
library:refreshConfigs()

local aimbotGroup = aimbotTab:createGroup(0)
local rifleGroup,rifleFrame = aimbotTab:createGroup(1)
local pistolGroup,pistolFrame = aimbotTab:createGroup(1)
local heavypGroup,heavypFrame = aimbotTab:createGroup(1)
local awpGroup,awpFrame = aimbotTab:createGroup(1)
local scoutGroup,scoutFrame = aimbotTab:createGroup(1)
local otherGroup,otherFrame = aimbotTab:createGroup(1)

-- insane code
rifleGroup:addToggle({text = "Aim Assist",flag = "rifle_assist"})
rifleGroup:addToggle({text = "Silent Aim",flag = "rifle_silent"})
rifleGroup:addToggle({text = "Triggerbot",flag = "rifl_triggerbot"})
rifleGroup:addSlider({text = "Aim Assist FOV",flag = "rifle_assist_fov",min = 0,max = 500,value = 100})
rifleGroup:addSlider({text = "Silent Aim FOV",flag = "rifle_silent_fov",min = 0,max = 500,value = 25})
rifleGroup:addSlider({text = "Smoothness",flag = "rifle_assist_smoothness",min = 1,max = 50,value = 10})
rifleGroup:addSlider({text = "Triggerbot Delay",flag = "rifle_triggerdelay",min = 0,max = 200,value = 0})
rifleGroup:addList({text = "Hitboxes",flag = "rifle_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

pistolGroup:addToggle({text = "Aim Assist",flag = "pistol_assist"})
pistolGroup:addToggle({text = "Silent Aim",flag = "pistol_silent"})
pistolGroup:addToggle({text = "Triggerbot",flag = "pistol_triggerbot"})
pistolGroup:addSlider({text = "Aim Assist FOV",flag = "pistol_assist_fov",min = 0,max = 500,value = 100})
pistolGroup:addSlider({text = "Silent Aim FOV",flag = "pistol_silent_fov",min = 0,max = 500,value = 25})
pistolGroup:addSlider({text = "Smoothness",flag = "pistol_assist_smoothness",min = 1,max = 50,value = 10})
pistolGroup:addSlider({text = "Triggerbot Delay",flag = "pistol_triggerdelay",min = 0,max = 200,value = 0})
pistolGroup:addList({text = "Hitboxes",flag = "pistol_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

heavypGroup:addToggle({text = "Aim Assist",flag = "heavyp_assist"})
heavypGroup:addToggle({text = "Silent Aim",flag = "heavyp_silent"})
heavypGroup:addToggle({text = "Triggerbot",flag = "heavyp_triggerbot"})
heavypGroup:addSlider({text = "Aim Assist FOV",flag = "heavyp_assist_fov",min = 0,max = 500,value = 100})
heavypGroup:addSlider({text = "Silent Aim FOV",flag = "heavyp_silent_fov",min = 0,max = 500,value = 25})
heavypGroup:addSlider({text = "Smoothness",flag = "heavyp_assist_smoothness",min = 1,max = 50,value = 10})
heavypGroup:addSlider({text = "Triggerbot Delay",flag = "heavyp_triggerdelay",min = 0,max = 200,value = 0})
heavypGroup:addList({text = "Hitboxes",flag = "heavyp_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

awpGroup:addToggle({text = "Aim Assist",flag = "awp_assist"})
awpGroup:addToggle({text = "Silent Aim",flag = "awp_silent"})
awpGroup:addToggle({text = "Triggerbot",flag = "awp_triggerbot"})
awpGroup:addSlider({text = "Aim Assist FOV",flag = "awp_assist_fov",min = 0,max = 500,value = 100})
awpGroup:addSlider({text = "Silent Aim FOV",flag = "awp_silent_fov",min = 0,max = 500,value = 25})
awpGroup:addSlider({text = "Smoothness",flag = "awp_assist_smoothness",min = 1,max = 50,value = 10})
awpGroup:addSlider({text = "Triggerbot Delay",flag = "awp_triggerdelay",min = 0,max = 200,value = 0})
awpGroup:addList({text = "Hitboxes",flag = "awp_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

scoutGroup:addToggle({text = "Aim Assist",flag = "scout_assist"})
scoutGroup:addToggle({text = "Silent Aim",flag = "scout_silent"})
scoutGroup:addToggle({text = "Triggerbot",flag = "scout_triggerbot"})
scoutGroup:addSlider({text = "Aim Assist FOV",flag = "scout_assist_fov",min = 0,max = 500,value = 100})
scoutGroup:addSlider({text = "Silent Aim FOV",flag = "scout_silent_fov",min = 0,max = 500,value = 25})
scoutGroup:addSlider({text = "Smoothness",flag = "scout_assist_smoothness",min = 1,max = 50,value = 10})
scoutGroup:addSlider({text = "Triggerbot Delay",flag = "scout_triggerdelay",min = 0,max = 200,value = 0})
scoutGroup:addList({text = "Hitboxes",flag = "scout_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

otherGroup:addToggle({text = "Aim Assist",flag = "other_assist"})
otherGroup:addToggle({text = "Silent Aim",flag = "other_silent"})
otherGroup:addToggle({text = "Triggerbot",flag = "other_triggerbot"})
otherGroup:addSlider({text = "Aim Assist FOV",flag = "other_assist_fov",min = 0,max = 500,value = 100})
otherGroup:addSlider({text = "Silent Aim FOV",flag = "other_silent_fov",min = 0,max = 500,value = 25})
otherGroup:addSlider({text = "Smoothness",flag = "other_assist_smoothness",min = 1,max = 50,value = 10})
otherGroup:addSlider({text = "Triggerbot Delay",flag = "other_triggerdelay",min = 0,max = 200,value = 0})
otherGroup:addList({text = "Hitboxes",flag = "other_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

aimbotGroup:addToggle({text = "Enabled",flag = "aimbot_enabled"})
aimbotGroup:addToggle({text = "Teammates",flag = "aimbot_team"})
aimbotGroup:addToggle({text = "Visible Only",flag = "aimbot_visonly"})
aimbotGroup:addToggle({text = "Auto Pistol",flag = "auto_pistol",callback = function(val)
    for i,v in next, replicatedStorage.Weapons:GetChildren() do
        if v:FindFirstChild("Secondary") and v.Name ~= "CZ" then
            v.Auto.Value = val
        end
    end
end})
aimbotGroup:addKeybind({text = "Aimbot Key",flag = "aimbot_keybind",key = Enum.KeyCode.LeftAlt}) -- NOVO
aimbotGroup:addList({text = "Aimbot Mode",flag = "aimbot_mode",values = {"Hold","Toggle","Always"}}) -- NOVO
aimbotGroup:addKeybind({text = "Triggerbind",flag = "trigger_keybind",key = Enum.KeyCode.LeftAlt})
aimbotGroup:addList({text = "Weapon",skipflag = true,flag = "aimbot_weapon",values = {"Rifle","Pistol","Heavy Pistol","Awp","Scout","Other"},callback = function(val)
    rifleFrame.Visible = val == "Rifle"
    pistolFrame.Visible = val == "Pistol"
    heavypFrame.Visible = val == "Heavy Pistol"
    awpFrame.Visible = val == "Awp"
    scoutFrame.Visible = val == "Scout"
    otherFrame.Visible = val == "Other"
end})

local espGroup,espFrame = visualsTab:createGroup(0)
local worldGroup,worldFrame = visualsTab:createGroup(0)
local worldGroup2,worldFrame2 = visualsTab:createGroup(0)
local drawingGroup,drawingFrame = visualsTab:createGroup(1)
local worldSettings,worldSettingsFrame = visualsTab:createGroup(1)
local worldSettings2,worldSettingsFrame2 = visualsTab:createGroup(1)
local toggleTab,toggleFrame = visualsTab:createGroup(0)

espGroup:addToggle({text = "ESP Enabled",flag = "esp_enabled",callback = function() for i,v in next, espObjects do v.invis() end end})
espGroup:addToggle({text = "Box ESP",flag = "box_enabled"})
espGroup:addToggle({text = "Name ESP",flag = "name_enabled"})
espGroup:addToggle({text = "Health Bar",flag = "healthbar_enabled"})

worldGroup:addToggle({text = "Weapon Chams",flag = "weapon_chams",callback = updateViewmodel})
worldGroup:addToggle({text = "Arm Chams",flag = "arm_chams",callback = updateViewmodel})
worldGroup:addToggle({text = "Remove Sleeves",flag = "remove_sleeves",callback = updateViewmodel})
worldGroup:addToggle({text = "Bullet Tracers",flag = "bullet_tracer"})
worldGroup:addToggle({text = "World Gradient",flag = "world_gradient"})

worldSettings:addToggle({text = "Time Changer",flag = "time_changer",callback = function()
    wait()
    lighting.TimeOfDay = 15
end})
worldSettings:addToggle({text = "Skybox Changer",flag = "skybox_changer",callback = updateSkybox})
worldSettings:addToggle({text = "Remove Flash",flag = "remove_flash",callback = function(v)
    localPlayer.PlayerGui.Blnd.Blind.Visible = not v
end})
worldSettings:addToggle({text = "Remove Radio",flag = "remove_radio"})
worldSettings:addToggle({text = "Viewmodel Changer",flag = "viewmodel_changer"})

worldGroup2:addColorpicker({text = "Box Color",ontop = true,flag = "box_color",color = Color3.new(1,1,1)})
worldGroup2:addColorpicker({text = "Name Color",ontop = true,flag = "name_color",color = Color3.new(1,1,1)})
worldGroup2:addColorpicker({text = "Health Bar Color",ontop = true,flag = "healthbar_color",color = Color3.new(0.2,0.75,0.2)})
worldGroup2:addDivider()
worldGroup2:addColorpicker({text = "Weapon Chams Color",ontop = true,callback = updateViewmodel,flag = "weapon_color",color = Color3.new(0.25,0.15,0.6)})
worldGroup2:addColorpicker({text = "Arm Chams Color",ontop = true,callback = updateViewmodel,flag = "arm_color",color = Color3.new(0.15,0.05,0.55)})
worldGroup2:addDivider()
worldGroup2:addColorpicker({text = "Tracer Color",ontop = true,flag = "tracer_color",color = Color3.new(1,1,1)})


-- Restante do código do WorldGroup2 (assumindo que o código original termina na cor do Tracer)

worldGroup2:addSlider({text = "Weapon Transparency",flag = "weapon_trans",min = 0,max = 100,value = 0,callback = updateViewmodel})
worldGroup2:addSlider({text = "Arm Transparency",flag = "arm_trans",min = 0,max = 100,value = 0,callback = updateViewmodel})
worldGroup2:addDivider()
worldGroup2:addSlider({text = "Time (Hours)",flag = "time_value",min = 0,max = 24,value = 15,callback = function(val)
    lighting.TimeOfDay = val
end})
worldGroup2:addList({text = "Skybox",flag = "selected_skybox",values = {"Purple Nebula","Night Sky","Pink Daylight","Morning Glow","Setting Sun","Fade Blue","Elegant Morning","Neptune","Redshift","Aesthetic Night"},callback = updateSkybox})
worldGroup2:addDivider()
worldGroup2:addSlider({text = "Viewmodel X",flag = "viewmodel_x",min = 0,max = 40,value = 20})
worldGroup2:addSlider({text = "Viewmodel Y",flag = "viewmodel_y",min = 0,max = 40,value = 20})
worldGroup2:addSlider({text = "Viewmodel Z",flag = "viewmodel_z",min = 0,max = 40,value = 20})

drawingGroup:addToggle({text = "Watermark",flag = "watermark",callback = function(v) astrixseteWatermark.Visible = v end})
drawingGroup:addToggle({text = "Spectator List",flag = "speclist",callback = function(v) speclistText.Visible = v end})

local miscGroup = miscTab:createGroup(0)
miscGroup:addToggle({text = "No Fall Damage",flag = "fall_damage"})
miscGroup:addToggle({text = "No Fire Damage",flag = "fire_damage"})
miscGroup:addToggle({text = "Unlock Skins",flag = "unlock_skins",callback = function(v) unlockInventory = v end})
miscGroup:addList({text = "Hitsound",flag = "hitsound_value",values = {"Bameware","Bell","Bubble","Pick","Pop","Rust","Skeet","Neverlose","Minecraft"}})
miscGroup:addSlider({text = "Hitsound Volume",flag = "hitsound_volume",min = 0,max = 1,value = 1})
miscGroup:addToggle({text = "Hitsound",flag = "hitsound_enabled"})

-- loops
runService.RenderStepped:Connect(function()
    if menu.Enabled then
        userInputService.MouseBehavior = Enum.MouseBehavior.Default
    else
        userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end

    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
        if hookJp and localPlayer.Character.Humanoid.JumpPower ~= 22 then
            localPlayer.Character.Humanoid.JumpPower = 22
        end
    end

    if library.flags["watermark"] then
        astrixseteWatermark.Text = "astrixsete | v"..ver
        astrixseteWatermark.Color = library.libColor
        astrixseteWatermark.Position = Vector2.new(50,24)
    end
    if library.flags["speclist"] then
        local speclist = {}
        local text = "Spectators: "
        for i,v in next, players:GetPlayers() do
            if v.Character and not v.Character:FindFirstChild("HumanoidRootPart") and v ~= localPlayer then
                table.insert(speclist,v.Name)
            end
        end
        if #speclist > 0 then
            speclistText.Text = text..table.concat(speclist,", ")
        else
            speclistText.Text = text.."None"
        end
    end

    if library.flags["aimbot_enabled"] and isAlive() then

        local shouldAim = checkAimbotActivation() -- CHECA A ATIVAÇÃO AQUI

        local target,dist = getNearest(library.flags["aimbot_visonly"],library.flags["aimbot_team"])

        if target and target.Character and localPlayer.Character and localPlayer.Character.EquippedTool.Value and localPlayer.Character:FindFirstChild("EquippedTool") then
            local weapon = getWeaponInfo()
            if weapon.aim_assist or weapon.silent_aim then
                if weapon.aim_assist and dist <= weapon.assist_fov and shouldAim then
                    local hit,pos = nil,nil
                    for i,v in next, weapon.hitboxes do
                        if target.Character:FindFirstChild(v) and target.Character[v]:IsA("BasePart") then
                            local ray = Ray.new(camera.CFrame.p,(target.Character[v].Position - camera.CFrame.p).unit * 500)
                            local hitRay,_ = workspace:FindPartOnRayWithIgnoreList(ray, {camera,localPlayer.Character,workspace.Ray_Ignore,workspace.Map.Clips,workspace.Map.SpawnPoints})
                            if hitRay and hitRay:IsDescendantOf(target.Character) then
                                hit,pos = target.Character[v],target.Character[v].Position
                                break
                            end
                        end
                    end

                    if hit and pos then
                        local vector,onScreen = camera:WorldToScreenPoint(pos)
                        local mouseVector = Vector2.new(mouse.X,mouse.Y)
                        local targetVector = Vector2.new(vector.X,vector.Y)
                        local unit = (targetVector - mouseVector).unit
                        local distance = (targetVector - mouseVector).magnitude
                        
                        if distance > 1 then
                            mouse.X = mouse.X + unit.X * math.min(distance/weapon.smoothness,distance)
                            mouse.Y = mouse.Y + unit.Y * math.min(distance/weapon.smoothness,distance)
                        end
                    end
                end

                if weapon.silent_aim and dist <= weapon.silent_fov and shouldAim then
                    local hit,pos = nil,nil
                    for i,v in next, weapon.hitboxes do
                        if target.Character:FindFirstChild(v) and target.Character[v]:IsA("BasePart") then
                            local ray = Ray.new(camera.CFrame.p,(target.Character[v].Position - camera.CFrame.p).unit * 500)
                            local hitRay,_ = workspace:FindPartOnRayWithIgnoreList(ray, {camera,localPlayer.Character,workspace.Ray_Ignore,workspace.Map.Clips,workspace.Map.SpawnPoints})
                            if hitRay and hitRay:IsDescendantOf(target.Character) then
                                hit,pos = target.Character[v],target.Character[v].Position
                                break
                            end
                        end
                    end
                    if hit and pos then
                        silentPart = hit
                    else
                        silentPart = nil
                    end
                else
                    silentPart = nil
                end
            else
                silentPart = nil
            end
            if weapon.triggerbot and isButtonDown(library.flags["trigger_keybind"]) and weapon.silent_aim then
                local ray = Ray.new(camera.CFrame.p,(target.Character.Head.Position - camera.CFrame.p).unit * 500)
                local hit,_ = workspace:FindPartOnRayWithIgnoreList(ray, {camera,localPlayer.Character,workspace.Ray_Ignore,workspace.Map.Clips,workspace.Map.SpawnPoints})
                if hit and hit:IsDescendantOf(target.Character) then
                    localPlayer.Character.EquippedTool.Value:FireServer("Fire",decodePos(client.firebullet(client,0,true,0)))
                end
            end
        else
            silentPart = nil
        end

        if not shouldAim then -- GARANTE QUE DESLIGA SE A KEYBIND NÃO ESTIVER ATIVA
            silentPart = nil
        end

    else
        silentPart = nil
    end
    
    if timeout > 0 then timeout -= 1 end
    if lighting.TimeOfDay ~= library.flags["time_value"] and library.flags["time_changer"] then
        lighting.TimeOfDay = library.flags["time_value"]
    end
    updateViewmodel()

    for i,v in next, espObjects do
        local plr = players:FindFirstChild(i)
        if plr and isAlive(plr) and plr ~= localPlayer and plr.Team ~= localPlayer.Team and library.flags["esp_enabled"] then
            v.text.Visible = library.flags["name_enabled"]
            v.textshadow.Visible = library.flags["name_enabled"]
            v.box.Visible = library.flags["box_enabled"]
            v.boxol.Visible = library.flags["box_enabled"]
            v.boxil.Visible = library.flags["box_enabled"]
            v.healthb.Visible = library.flags["healthbar_enabled"]
            v.healthbo.Visible = library.flags["healthbar_enabled"]

            local headPos,onScreen = camera:WorldToScreenPoint(plr.Character.Head.Position+Vector3.new(0,0.5,0))
            local footPos,_ = camera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position-Vector3.new(0,2,0))

            local height = footPos.Y-headPos.Y
            local width = height/2.5

            local center = Vector2.new(headPos.X,headPos.Y)
            local box = {
                Position = Vector2.new(center.X-width/2,center.Y),
                Size = Vector2.new(width,height)
            }
            
            v.text.Text = plr.Name.." ["..math.floor(plr.Character.Humanoid.Health).."hp]"
            v.text.Position = Vector2.new(box.Position.X+box.Size.X/2-v.text.TextBounds.X/2,box.Position.Y-20)
            v.text.Color = library.flags["name_color"]

            v.textshadow.Text = plr.Name.." ["..math.floor(plr.Character.Humanoid.Health).."hp]"
            v.textshadow.Position = Vector2.new(box.Position.X+box.Size.X/2-v.text.TextBounds.X/2+1,box.Position.Y-19)

            v.box.Position = floor(box.Position)
            v.box.Size = floor(box.Size)
            v.box.Color = library.flags["box_color"]

            v.boxol.Position = floor(box.Position-Vector2.new(1,1))
            v.boxol.Size = floor(box.Size+Vector2.new(2,2))

            v.boxil.Position = floor(box.Position+Vector2.new(1,1))
            v.boxil.Size = floor(box.Size-Vector2.new(2,2))

            local maxHealth = 100
            local health = plr.Character.Humanoid.Health
            local hp = health/maxHealth
            local barHeight = box.Size.Y*hp

            v.healthb.Size = Vector2.new(3,barHeight)
            v.healthb.Position = Vector2.new(box.Position.X-4,box.Position.Y+box.Size.Y-barHeight)
            v.healthb.Filled = true
            v.healthb.Color = library.flags["healthbar_color"]

            v.healthbo.Position = Vector2.new(box.Position.X-5,box.Position.Y-1)
            v.healthbo.Size = Vector2.new(5,box.Size.Y+2)
            v.healthbo.Filled = false
        else
            v.invis()
        end
    end
end)


-- events
players.PlayerAdded:Connect(createEsp)
for i,v in next, players:GetPlayers() do
    createEsp(v)
end
players.PlayerRemoving:Connect(function(plr)
    if espObjects[plr.Name] then
        espObjects[plr.Name].remove()
    end
end)
