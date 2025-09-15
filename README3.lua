-- UFO HUB X • Part 1/3  (Key UI + Storage + Full Keys)
if _G.__UFOX_FULL then return end
_G.__UFOX_FULL = true

-- Services
local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS          = game:GetService("UserInputService")
local HttpService  = game:GetService("HttpService")
local StarterGui   = game:GetService("StarterGui")
local lp           = Players.LocalPlayer or Players.PlayerAdded:Wait()
local pg           = lp:WaitForChild("PlayerGui")

-- Theme
local GREEN   = Color3.fromRGB(22,247,123)
local WHITE   = Color3.fromRGB(255,255,255)
local BLACK   = Color3.fromRGB(0,0,0)
local CARD_BG = Color3.fromRGB(18,20,24)
local INPUTBG = Color3.fromRGB(32,36,42)
local RED     = Color3.fromRGB(235,70,85)
local TXT     = Color3.fromRGB(235,240,245)
local TXT2    = Color3.fromRGB(170,180,190)
local LOGO_ID = "rbxassetid://106029438403666"

-- Utils
local function notify(msg) pcall(function() StarterGui:SetCore("SendNotification",{Title="UFO HUB X",Text=msg,Duration=5}) end) end
local function center(o) o.AnchorPoint=Vector2.new(0.5,0.5); o.Position=UDim2.fromScale(0.5,0.5) end
local function smoothDrag(handle, frame)
	local dragging, startPos, startInput
	handle.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=true; startInput=i; startPos=frame.Position
		end
	end)
	handle.InputEnded:Connect(function(i) if i==startInput then dragging=false end end)
	UIS.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
			local d=i.Position-startInput.Position
			frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
		end
	end)
end

-- Storage (writefile fallback to _G)
local PATH="UFOX_KEY_STORE.json"
local haveFS=(writefile and isfile and readfile) and true or false
local function readStore()
	if haveFS and isfile(PATH) then
		local ok,res=pcall(function() return HttpService:JSONDecode(readfile(PATH)) end)
		if ok and type(res)=="table" then return res end
	end
	_G.__UFOX_MEM=_G.__UFOX_MEM or {}; return _G.__UFOX_MEM
end
local function writeStore(t)
	if haveFS then pcall(function() writefile(PATH,HttpService:JSONEncode(t)) end) else _G.__UFOX_MEM=t end
end

-- Full Keys (100 ปกติ + 2 พิเศษ) — บีบให้อยู่ไม่กี่บรรทัด
local NORMAL_KEYS = {"UFOHUBXDMF9YK0XZM24h","UFOHUBX70OJIR4IF124h","UFOHUBX59XO3283ZB24h","UFOHUBX0G86MNVDJX24h","UFOHUBX4Z80TW9L5H24h","UFOHUBX7RXW8H0JX224h","UFOHUBX66CXRW8Q6P24h","UFOHUBX8G8K2S2QO624h","UFOHUBXWZQJX4BC1V24h","UFOHUBX9W6A1GZ0MZ24h","UFOHUBXK8B3O3NGOB24h","UFOHUBX8N3O2R3V8K24h","UFOHUBX8N9VQ8Z6Q324h","UFOHUBX3UCFY0X5VH24h","UFOHUBX4XHZC7Y2J124h","UFOHUBX6H5H2M8H1B24h","UFOHUBX6N2MBXJ0ZP24h","UFOHUBXQ3D4XK3W7C24h","UFOHUBX9Y0Z6R3V1W24h","UFOHUBX0G2L0Q8P0A24h","UFOHUBX2T2M4X0P1P24h","UFOHUBX2QFQ5H2QK724h","UFOHUBX7H4M9H3M6I24h","UFOHUBX0C3W2J8O2U24h","UFOHUBX1Z0V2J8L5W24h","UFOHUBX7G8G7S8D7Z24h","UFOHUBX9A5K6B4W0P24h","UFOHUBX2C6C7S4T6J24h","UFOHUBXT9E4L7W1Z824h","UFOHUBX2X9V4I8Y4N24h","UFOHUBX2F2Z2M5S5D24h","UFOHUBX1D3H7N9T2K24h","UFOHUBX8W4B8M2A1P24h","UFOHUBX3V8Q5M7K2C24h","UFOHUBX7Q2I5G3W0Z24h","UFOHUBX4N0E0N4L0P24h","UFOHUBX0G8N7L7C3V24h","UFOHUBX5Q1J7M6Z4A24h","UFOHUBXC5I0H9U3S824h","UFOHUBX0J4Q1E4T4E24h","UFOHUBX5C1E1J0B3O24h","UFOHUBX7T6M5N4V1S24h","UFOHUBX4I9A0V0E4Z24h","UFOHUBX1Z8N4R2Q0K24h","UFOHUBX3Y5K1H2Q3J24h","UFOHUBX5J7C2G1P8M24h","UFOHUBX1R0I7Z8S0V24h","UFOHUBX6G2K5N8L3D24h","UFOHUBX2N1Z5M4C7B24h","UFOHUBX3W6Q4E9J1N24h","UFOHUBX4Q2M6H1C9X24h","UFOHUBX7P4V2L9T0I24h","UFOHUBX8M0D1Q3W7E24h","UFOHUBX9L5S2A4K6Z24h","UFOHUBX0K1P3O5I7U24h","UFOHUBX4U3I5Y7T9R24h","UFOHUBX2M4N6B8V0C24h","UFOHUBX6B7V9C1X3Z24h","UFOHUBX8V1C3X5Z7B24h","UFOHUBX0C2X4Z6B8N24h","UFOHUBX3Z5B7N9M1V24h","UFOHUBX5B8N0M2V4C24h","UFOHUBX7N2M4V6C8X24h","UFOHUBX9M4V6C8X0Z24h","UFOHUBX1V3C5X7Z9B24h","UFOHUBX2C4X6Z8B0N24h","UFOHUBX3X6Z8B0N2M24h","UFOHUBX4Z7B9N1M3V24h","UFOHUBX5N9M1V3C5X24h","UFOHUBX6M1V3C5X7Z24h","UFOHUBX7V3C5X7Z9B24h","UFOHUBX8C5X7Z9B1N24h","UFOHUBX9X7Z9B1N3M24h","UFOHUBX0Z9B1N3M5V24h","UFOHUBX1B1N3M5V7C24h","UFOHUBX2N3M5V7C9X24h","UFOHUBX3M5V7C9X1Z24h","UFOHUBX4V7C9X1Z3B24h","UFOHUBX5C9X1Z3B5N24h","UFOHUBX6X1Z3B5N7M24h","UFOHUBX7Z3B5N7M9V24h","UFOHUBX8B5N7M9V1C24h","UFOHUBX9N7M9V1C3X24h","UFOHUBX0M9V1C3X5Z24h","UFOHUBX1V1C3X5Z7B24h","UFOHUBX2C3X5Z7B9N24h","UFOHUBX3X5Z7B9N1M24h","UFOHUBX4Z7B9N1M3V24h","UFOHUBX5B9N1M3V5C24h","UFOHUBX6N1M3V5C7X24h","UFOHUBX7M3V5C7X9Z24h","UFOHUBX8V5C7X9Z1B24h","UFOHUBX9C7X9Z1B3N24h","UFOHUBX0X9Z1B3N5M24h","UFOHUBX1Z1B3N5M7V24h","UFOHUBX2B3N5M7V9C24h","UFOHUBX3N5M7V9C1X24h","UFOHUBX4M7V9C1X3Z24h","UFOHUBX5V9C1X3Z5B24h","UFOHUBX6C1X3Z5B7N24h","UFOHUBX7X3Z5B7N9M24h","UFOHUBX8Z5B7N9M1V24h","UFOHUBX9B7N9M1V3C24h","UFOHUBX0N9M1V3C5X24h","UFOHUBX1M1V3C5X7Z24h","UFOHUBX2V3C5X7Z9B24h","UFOHUBX3C5X7Z9B1N24h","UFOHUBX4X7Z9B1N3M24h","UFOHUBX5Z9B1N3M5V24h","UFOHUBX6B1N3M5V7C24h","UFOHUBX7N3M5V7C9X24h","UFOHUBX8M5V7C9X1Z24h","UFOHUBX9V7C9X1Z3B24h","UFOHUBX1H049FTRA024h","UFOHUBX7GB158W98N24h","UFOHUBXLQ7T871OFY24h","UFOHUBXZPPK52HC8G24h","UFOHUBXBO6IC0I7MM24h"}
local NORMAL_SET={} for _,k in ipairs(NORMAL_KEYS) do NORMAL_SET[k]=true end

local function validateKey(inputKey)
	local s=readStore()
	if s.perm then return true,"PERM" end
	if s.session then return true,"SESSION" end
	if s.expire and os.time()<s.expire then return true,"24H" end
	if inputKey=="PanuphongArtphairin" then s.perm=true; s.session=nil; s.expire=nil; writeStore(s); return true,"PERM" end
	if inputKey=="JJJMAX" then s.session=true; s.expire=nil; writeStore(s); return true,"SESSION" end
	if NORMAL_SET[inputKey] then s.expire=os.time()+86400; s.session=nil; writeStore(s); return true,"24H" end
	return false
end

-- Key UI (ขอบเขียวทุกชิ้น, ปุ่มใหญ่, Get/Discord แยกซ้ายขวา)
local function showKeyUI(onOK)
	local gui=Instance.new("ScreenGui",pg); gui.Name="UFOX_KEY_UI"; gui.DisplayOrder=2000
	local dim=Instance.new("Frame",gui); dim.Size=UDim2.fromScale(1,1); dim.BackgroundColor3=BLACK; dim.BackgroundTransparency=0.35
	local card=Instance.new("Frame",gui); card.Size=UDim2.fromOffset(680,360); center(card); card.BackgroundColor3=CARD_BG
	Instance.new("UICorner",card).CornerRadius=UDim.new(0,16); local cardStroke=Instance.new("UIStroke",card); cardStroke.Color=GREEN; cardStroke.Thickness=2

	local header=Instance.new("Frame",card); header.Size=UDim2.new(1,-24,0,56); header.Position=UDim2.fromOffset(12,12); header.BackgroundTransparency=1
	local logo=Instance.new("ImageLabel",header); logo.Image=LOGO_ID; logo.Size=UDim2.fromOffset(34,34); logo.Position=UDim2.fromOffset(4,11); logo.BackgroundTransparency=1
	local head=Instance.new("TextLabel",header); head.Text="KEY SYSTEM · เข้าสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)"; head.Font=Enum.Font.GothamBold; head.TextSize=18
	head.TextColor3=TXT; head.TextXAlignment=Enum.TextXAlignment.Left; head.Size=UDim2.new(1,-120,1,-8); head.Position=UDim2.fromOffset(46,8); head.BackgroundTransparency=1
	local close=Instance.new("TextButton",header); close.Text="✕"; close.Size=UDim2.fromOffset(40,40); close.Position=UDim2.new(1,-44,0,8)
	close.BackgroundColor3=Color3.fromRGB(36,40,46); close.Font=Enum.Font.GothamBold; close.TextSize=20; close.TextColor3=TXT; close.AutoButtonColor=false
	Instance.new("UICorner",close).CornerRadius=UDim.new(0,10); local cb=Instance.new("UIStroke",close); cb.Color=GREEN; cb.Thickness=2
	close.MouseEnter:Connect(function() close.BackgroundColor3=RED; close.TextColor3=WHITE end)
	close.MouseLeave:Connect(function() close.BackgroundColor3=Color3.fromRGB(36,40,46); close.TextColor3=TXT end)
	close.MouseButton1Click:Connect(function() gui:Destroy() end)

	local input=Instance.new("TextBox",card); input.PlaceholderText="ใส่คีย์ที่นี่"; input.Text=""; input.Size=UDim2.new(1,-40,0,44)
	input.Position=UDim2.fromOffset(20,96); input.BackgroundColor3=INPUTBG; input.TextColor3=TXT; input.PlaceholderColor3=TXT2; input.Font=Enum.Font.Gotham; input.TextSize=16
	Instance.new("UICorner",input).CornerRadius=UDim.new(0,12); local inStroke=Instance.new("UIStroke",input); inStroke.Color=GREEN; inStroke.Thickness=2

	local submit=Instance.new("TextButton",card); submit.Text="Submit Key  ➜"; submit.Size=UDim2.new(1,-40,0,50)
	submit.Position=UDim2.fromOffset(20,154); submit.BackgroundColor3=BLACK; submit.Font=Enum.Font.GothamBlack; submit.TextSize=18; submit.TextColor3=WHITE
	Instance.new("UICorner",submit).CornerRadius=UDim.new(0,12); local sb=Instance.new("UIStroke",submit); sb.Color=GREEN; sb.Thickness=2
	submit.MouseEnter:Connect(function() TweenService:Create(submit,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(26,30,36)}):Play() end)
	submit.MouseLeave:Connect(function() TweenService:Create(submit,TweenInfo.new(0.1),{BackgroundColor3=BLACK}):Play() end)

	-- แถวล่าง: Get Key (ซ้าย) / Discord (ขวา)
	local row=Instance.new("Frame",card); row.Size=UDim2.new(1,-40,0,56); row.Position=UDim2.new(0,20,1,-72); row.BackgroundTransparency=1
	local getKey=Instance.new("TextButton",row); getKey.Text="🔑  Get Key"; getKey.Size=UDim2.fromOffset(220,56); getKey.Position=UDim2.fromOffset(0,0)
	getKey.BackgroundColor3=BLACK; getKey.Font=Enum.Font.GothamSemibold; getKey.TextSize=17; getKey.TextColor3=WHITE; Instance.new("UICorner",getKey).CornerRadius=UDim.new(0,12); local gS=Instance.new("UIStroke",getKey); gS.Color=GREEN; gS.Thickness=2
	local disc=Instance.new("TextButton",row); disc.Text="💬  Discord"; disc.Size=UDim2.fromOffset(220,56); disc.AnchorPoint=Vector2.new(1,0); disc.Position=UDim2.new(1,0,0,0)
	disc.BackgroundColor3=BLACK; disc.Font=Enum.Font.GothamSemibold; disc.TextSize=17; disc.TextColor3=WHITE; Instance.new("UICorner",disc).CornerRadius=UDim.new(0,12); local dS=Instance.new("UIStroke",disc); dS.Color=GREEN; dS.Thickness=2

	local function copy(url) if setclipboard then setclipboard(url) end; notify("คัดลอกลิงก์แล้ว: "..url) end
	getKey.MouseButton1Click:Connect(function() copy("https://linkunlocker.com/ufo-hub-x-wKfUt") end)
	disc.MouseButton1Click:Connect(function() copy("https://discord.gg/JFHuVVVQ6D") end)

	-- ผ่านคีย์แล้วข้ามอัตโนมัติ
	local okAlready=validateKey(nil)
	local function accept()
		TweenService:Create(card,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
		TweenService:Create(dim,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
		task.delay(0.21,function() gui:Destroy(); if onOK then onOK() end end)
	end
	if okAlready then accept(); return end

	submit.MouseButton1Click:Connect(function()
		if validateKey(input.Text) then accept()
		else input.Text=""; input.PlaceholderText="❌ คีย์ไม่ถูกต้อง"; inStroke.Color=RED; task.delay(0.35,function() inStroke.Color=GREEN end) end
	end)
end

_G.__UFOX_FULL_API = { showKeyUI = showKeyUI, smoothDrag = smoothDrag, theme = {GREEN=GREEN,WHITE=WHITE,LOGO_ID=LOGO_ID,TXT=TXT} }
-- UFO HUB X • Part 2/3 (Splash)
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local pg = Players.LocalPlayer:WaitForChild("PlayerGui")

local GREEN = _G.__UFOX_FULL_API.theme.GREEN
local WHITE = _G.__UFOX_FULL_API.theme.WHITE
local LOGO_ID = _G.__UFOX_FULL_API.theme.LOGO_ID

local function showSplash(onDone)
	local gui=Instance.new("ScreenGui",pg); gui.Name="UFOX_SPLASH"; gui.DisplayOrder=2500
	local bg=Instance.new("Frame",gui); bg.Size=UDim2.fromScale(1,1); bg.BackgroundColor3=Color3.new(0,0,0)

	local card=Instance.new("Frame",bg); card.Size=UDim2.fromOffset(560,300); card.AnchorPoint=Vector2.new(0.5,0.5); card.Position=UDim2.fromScale(0.5,0.5)
	card.BackgroundColor3=Color3.fromRGB(18,20,24); Instance.new("UICorner",card).CornerRadius=UDim.new(0,16); local st=Instance.new("UIStroke",card); st.Color=GREEN; st.Thickness=2

	local logo=Instance.new("ImageLabel",card); logo.Image=LOGO_ID; logo.Size=UDim2.fromOffset(96,96); logo.AnchorPoint=Vector2.new(0.5,0); logo.Position=UDim2.new(0.5,0,0,14); logo.BackgroundTransparency=1
	local title=Instance.new("TextLabel",card); title.Text='<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'; title.RichText=true; title.BackgroundTransparency=1
	title.Size=UDim2.new(1,0,0,42); title.Position=UDim2.new(0.5,0,0,120); title.AnchorPoint=Vector2.new(0.5,0); title.Font=Enum.Font.GothamBold; title.TextSize=30; title.TextColor3=WHITE

	local barBG=Instance.new("Frame",card); barBG.Size=UDim2.new(1,-80,0,30); barBG.Position=UDim2.new(0.5,0,0,175); barBG.AnchorPoint=Vector2.new(0.5,0)
	barBG.BackgroundColor3=Color3.fromRGB(50,50,50); Instance.new("UICorner",barBG).CornerRadius=UDim.new(0,12); local bs=Instance.new("UIStroke",barBG); bs.Color=WHITE; bs.Thickness=2
	local fill=Instance.new("Frame",barBG); fill.Size=UDim2.new(0,0,1,0); fill.BackgroundColor3=GREEN; Instance.new("UICorner",fill).CornerRadius=UDim.new(0,12)
	local rocket=Instance.new("TextLabel",barBG); rocket.Text="🚀"; rocket.TextSize=22; rocket.BackgroundTransparency=1; rocket.AnchorPoint=Vector2.new(0.5,0.5); rocket.Size=UDim2.fromOffset(28,28)
	local percent=Instance.new("TextLabel",card); percent.Text="0%"; percent.BackgroundTransparency=1; percent.Size=UDim2.new(1,0,0,40)
	percent.Position=UDim2.new(0.5,0,0,215); percent.AnchorPoint=Vector2.new(0.5,0); percent.Font=Enum.Font.GothamBold; percent.TextSize=32; percent.TextColor3=WHITE

	card.Size=UDim2.fromOffset(520,280)
	TweenService:Create(card,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.fromOffset(560,300)}):Play()

	local TOTAL=10; local start=tick(); local LEAD=10
	while true do
		local t=math.clamp((tick()-start)/TOTAL,0,1); local e=1-(1-t)^3
		fill.Size=UDim2.new(e,0,1,0)
		local w=barBG.AbsoluteSize.X; rocket.Position=UDim2.new(0.5, e*w - w/2 + LEAD, 0.5, 0)
		percent.Text=("%d%%"):format(math.floor(e*100))
		if t>=1 then break end
		task.wait()
	end

	TweenService:Create(card,TweenInfo.new(0.45),{BackgroundTransparency=1}):Play()
	TweenService:Create(bg,TweenInfo.new(0.45),{BackgroundTransparency=1}):Play()
	task.wait(0.46); gui:Destroy(); if onDone then onDone() end
end

_G.__UFOX_FULL_API.showSplash = showSplash
-- UFO HUB X • Part 3/3 (Main UI + Flow)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

local T = _G.__UFOX_FULL_API.theme
local smoothDrag = _G.__UFOX_FULL_API.smoothDrag

local function showMainUI()
	local gui=Instance.new("ScreenGui",pg); gui.Name="UFOX_MAIN"; gui.DisplayOrder=1500

	-- Toggle (ลากได้) — ขอบเขียว
	local toggle=Instance.new("ImageButton",gui); toggle.Image=T.LOGO_ID; toggle.BackgroundColor3=Color3.fromRGB(24,28,34)
	toggle.Size=UDim2.fromOffset(76,76); toggle.Position=UDim2.fromOffset(24,(pg.AbsoluteSize.Y/2)-38); Instance.new("UICorner",toggle).CornerRadius=UDim.new(0,16)
	local tS=Instance.new("UIStroke",toggle); tS.Color=T.GREEN; tS.Thickness=2; smoothDrag(toggle,toggle)

	-- Window หลัก — ทุกกรอบขอบเขียว
	local win=Instance.new("Frame",gui); win.Size=UDim2.fromOffset(880,420); win.AnchorPoint=Vector2.new(0.5,0.5); win.Position=UDim2.fromScale(0.5,0.5)
	win.BackgroundColor3=Color3.fromRGB(19,22,26); Instance.new("UICorner",win).CornerRadius=UDim.new(0,14)
	local wS=Instance.new("UIStroke",win); wS.Color=T.GREEN; wS.Thickness=2

	local header=Instance.new("Frame",win); header.Size=UDim2.new(1,0,0,52); header.BackgroundColor3=Color3.fromRGB(24,27,32)
	Instance.new("UICorner",header).CornerRadius=UDim.new(0,14); local hS=Instance.new("UIStroke",header); hS.Color=T.GREEN; hS.Thickness=2
	local logo=Instance.new("ImageLabel",header); logo.Image=T.LOGO_ID; logo.BackgroundTransparency=1; logo.Size=UDim2.fromOffset(28,28); logo.Position=UDim2.fromOffset(10,12)
	local title=Instance.new("TextLabel",header); title.RichText=true; title.TextXAlignment=Enum.TextXAlignment.Left; title.BackgroundTransparency=1
	title.Text='<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'; title.Font=Enum.Font.GothamBold; title.TextSize=20; title.TextColor3=T.TXT; title.Position=UDim2.fromOffset(46,12); title.Size=UDim2.new(1,-100,0,28)

	local close=Instance.new("TextButton",header); close.Text="✕"; close.Size=UDim2.fromOffset(34,34); close.Position=UDim2.new(1,-44,0.5,-17)
	close.BackgroundColor3=Color3.fromRGB(36,40,46); close.Font=Enum.Font.GothamBold; close.TextSize=18; close.TextColor3=T.TXT
	Instance.new("UICorner",close).CornerRadius=UDim.new(0,8); local cS=Instance.new("UIStroke",close); cS.Color=T.GREEN; cS.Thickness=2
	close.MouseEnter:Connect(function() close.BackgroundColor3=Color3.fromRGB(235,70,85); close.TextColor3=T.WHITE end)
	close.MouseLeave:Connect(function() close.BackgroundColor3=Color3.fromRGB(36,40,46); close.TextColor3=T.TXT end)
	close.MouseButton1Click:Connect(function() win.Visible=false end)

	-- Tabs (ขอบเขียว)
	local tabs=Instance.new("Frame",win); tabs.Size=UDim2.new(1,-16,0,38); tabs.Position=UDim2.fromOffset(8,60); tabs.BackgroundColor3=Color3.fromRGB(26,28,32)
	Instance.new("UICorner",tabs).CornerRadius=UDim.new(0,8); local tbs=Instance.new("UIStroke",tabs); tbs.Color=T.GREEN; tbs.Thickness=2
	local tl=Instance.new("UIListLayout",tabs); tl.FillDirection=Enum.FillDirection.Horizontal; tl.Padding=UDim.new(0,8)

	local content=Instance.new("Frame",win); content.Size=UDim2.new(1,-16,1,-110); content.Position=UDim2.fromOffset(8,106); content.BackgroundColor3=Color3.fromRGB(26,28,32)
	Instance.new("UICorner",content).CornerRadius=UDim.new(0,10); local cs=Instance.new("UIStroke",content); cs.Color=T.GREEN; cs.Thickness=2

	-- 2 คอลัมน์ (ขอบเขียว)
	local colL=Instance.new("Frame",content); colL.Size=UDim2.new(0.5,-6,1,0); colL.BackgroundColor3=Color3.fromRGB(24,27,32)
	Instance.new("UICorner",colL).CornerRadius=UDim.new(0,10); local lS=Instance.new("UIStroke",colL); lS.Color=T.GREEN; lS.Thickness=2
	local colR=Instance.new("Frame",content); colR.Size=UDim2.new(0.5,-6,1,0); colR.Position=UDim2.new(0.5,12,0,0); colR.BackgroundColor3=Color3.fromRGB(24,27,32)
	Instance.new("UICorner",colR).CornerRadius=UDim.new(0,10); local rS=Instance.new("UIStroke",colR); rS.Color=T.GREEN; rS.Thickness=2

	-- ตัวอย่างป้าย (เพื่อนค่อยเติมระบบของตัวเอง)
	local l=Instance.new("TextLabel",colL); l.BackgroundTransparency=1; l.TextColor3=T.GREEN; l.Font=Enum.Font.GothamSemibold; l.TextSize=14; l.TextXAlignment=Enum.TextXAlignment.Left
	l.Position=UDim2.fromOffset(10,10); l.Size=UDim2.new(1,-20,0,20); l.Text="• ใส่ปุ่ม/สไลเดอร์ด้านซ้าย"
	local r=Instance.new("TextLabel",colR); r.BackgroundTransparency=1; r.TextColor3=T.GREEN; r.Font=Enum.Font.GothamSemibold; r.TextSize=14; r.TextXAlignment=Enum.TextXAlignment.Left
	r.Position=UDim2.fromOffset(10,10); r.Size=UDim2.new(1,-20,0,20); r.Text="• ใส่ปุ่ม/สไลเดอร์ด้านขวา"

	-- ปุ่มแท็บ (ทุกปุ่มมีขอบเขียว)
	local function mkTab(txt)
		local b=Instance.new("TextButton",tabs); b.Text=txt; b.Size=UDim2.fromOffset(120,36); b.BackgroundColor3=Color3.fromRGB(20,22,26)
		b.Font=Enum.Font.GothamSemibold; b.TextSize=14; b.TextColor3=T.TXT; Instance.new("UICorner",b).CornerRadius=UDim.new(0,10); local s=Instance.new("UIStroke",b); s.Color=T.GREEN; s.Thickness=2
		b.MouseEnter:Connect(function() b.BackgroundColor3=Color3.fromRGB(28,32,38) end)
		b.MouseLeave:Connect(function() b.BackgroundColor3=Color3.fromRGB(20,22,26) end)
		return b
	end
	mkTab("หน้าหลัก"); mkTab("ผู้เล่น"); mkTab("ภาพ/แสง"); mkTab("เทเลพอร์ต"); mkTab("ตั้งค่า"); mkTab("เครดิต")

	-- Toggle show/hide (อนิเมชันลื่น)
	local lastPos
	local function show() win.Visible=true; if lastPos then win.Position=lastPos end end
	local function hide() lastPos=win.Position; win.Visible=false end
	toggle.MouseButton1Click:Connect(function() if win.Visible then hide() else show() end end)

	-- Drag โดยจับที่หัว
	smoothDrag(header,win)
	return gui
end

_G.__UFOX_FULL_API.showMainUI = showMainUI

-- Flow: Key -> Splash -> UI
local function boot()
	_G.__UFOX_FULL_API.showKeyUI(function()
		_G.__UFOX_FULL_API.showSplash(function()
			_G.__UFOX_FULL_API.showMainUI()
		end)
	end)
end

boot()
