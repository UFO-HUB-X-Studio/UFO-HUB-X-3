--[[
UFO HUB X — ONE-FILE SUPER LOADER (Key→Splash→Main UI)
ธีม: ดำ + เขียวเอเลียน | รวมทุกระบบที่คุยกันไว้ แบบไม่ตัดอะไรทิ้ง
ทำงานได้บนตัวรัน (Delta X / KRNL / อื่น ๆ) และใน Studio ก็ได้
]]--

------------------------ SERVICES ------------------------
local Players        = game:GetService("Players")
local TweenService   = game:GetService("TweenService")
local UserInputService= game:GetService("UserInputService")
local RunService     = game:GetService("RunService")
local StarterGui     = game:GetService("StarterGui")
local HttpService    = game:GetService("HttpService")

local lp = Players.LocalPlayer
local pg = lp:FindFirstChildOfClass("PlayerGui") or lp:WaitForChild("PlayerGui")

------------------------ THEME ---------------------------
local GREEN  = Color3.fromRGB(22,247,123)
local BLACK  = Color3.fromRGB(18,20,24)
local BG     = Color3.fromRGB(14,15,18)
local SOFT   = Color3.fromRGB(30,32,36)
local WHITE  = Color3.fromRGB(255,255,255)
local RED    = Color3.fromRGB(235,70,85)
local TXT    = Color3.fromRGB(235,240,245)
local TXT2   = Color3.fromRGB(170,180,190)
local LOGO   = "rbxassetid://106029438403666"

------------------------ FILE STORAGE (for executors) ----
local haveFS = (writefile and readfile and isfile and makefolder) and true or false
local STORE_DIR = "UFO_HUB_X"
local STORE = STORE_DIR.."/store.json"

local function ensureFolder()
	if haveFS then pcall(function() if not isfolder(STORE_DIR) then makefolder(STORE_DIR) end end) end
end

local function loadStore()
	if haveFS and isfile(STORE) then
		local ok, data = pcall(function() return HttpService:JSONDecode(readfile(STORE)) end)
		if ok and typeof(data) == "table" then return data end
	end
	_G.__UFOX_STORE = _G.__UFOX_STORE or {}
	return _G.__UFOX_STORE
end

local function saveStore(tab)
	if haveFS then
		ensureFolder()
		pcall(function() writefile(STORE, HttpService:JSONEncode(tab)) end)
	else
		_G.__UFOX_STORE = tab
	end
end

local STORE_DATA = loadStore()

------------------------ KEY DATABASE --------------------
-- 100 keys (ครบจากที่นายให้)
local NORMAL_KEYS = {
"UFOHUBXDMF9YK0XZM24h","UFOHUBX70OJIR4IF124h","UFOHUBX59XO3283ZB24h","UFOHUBX0G86MNVDJX24h",
"UFOHUBX4Z80TW9L5H24h","UFOHUBX7RXW8H0JX224h","UFOHUBX66CXRW8Q6P24h","UFOHUBX8G8K2S2QO624h",
"UFOHUBXWZQJX4BC1V24h","UFOHUBX9W6A1GZ0MZ24h","UFOHUBXK8B3O3NGOB24h","UFOHUBX8N3O2R3V8K24h",
"UFOHUBX8N9VQ8Z6Q324h","UFOHUBX3UCFY0X5VH24h","UFOHUBX4XHZC7Y2J124h","UFOHUBX6H5H2M8H1B24h",
"UFOHUBX6N2MBXJ0ZP24h","UFOHUBXQ3D4XK3W7C24h","UFOHUBX9Y0Z6R3V1W24h","UFOHUBX0G2L0Q8P0A24h",
"UFOHUBX2T2M4X0P1P24h","UFOHUBX2QFQ5H2QK724h","UFOHUBX7H4M9H3M6I24h","UFOHUBX0C3W2J8O2U24h",
"UFOHUBX1Z0V2J8L5W24h","UFOHUBX7G8G7S8D7Z24h","UFOHUBX9A5K6B4W0P24h","UFOHUBX2C6C7S4T6J24h",
"UFOHUBXT9E4L7W1Z824h","UFOHUBX2X9V4I8Y4N24h","UFOHUBX2F2Z2M5S5D24h","UFOHUBX1D3H7N9T2K24h",
"UFOHUBX8W4B8M2A1P24h","UFOHUBX3V8Q5M7K2C24h","UFOHUBX7Q2I5G3W0Z24h","UFOHUBX4N0E0N4L0P24h",
"UFOHUBX0G8N7L7C3V24h","UFOHUBX5Q1J7M6Z4A24h","UFOHUBXC5I0H9U3S824h","UFOHUBX0J4Q1E4T4E24h",
"UFOHUBX5C1E1J0B3O24h","UFOHUBX7T6M5N4V1S24h","UFOHUBX4I9A0V0E4Z24h","UFOHUBX1Z8N4R2Q0K24h",
"UFOHUBX3Y5K1H2Q3J24h","UFOHUBX5J7C2G1P8M24h","UFOHUBX1R0I7Z8S0V24h","UFOHUBX6G2K5N8L3D24h",
"UFOHUBX2N1Z5M4C7B24h","UFOHUBX3W6Q4E9J1N24h","UFOHUBX4Q2M6H1C9X24h","UFOHUBX7P4V2L9T0I24h",
"UFOHUBX8M0D1Q3W7E24h","UFOHUBX9L5S2A4K6Z24h","UFOHUBX0K1P3O5I7U24h","UFOHUBX4U3I5Y7T9R24h",
"UFOHUBX2M4N6B8V0C24h","UFOHUBX6B7V9C1X3Z24h","UFOHUBX8V1C3X5Z7B24h","UFOHUBX0C2X4Z6B8N24h",
"UFOHUBX3Z5B7N9M1V24h","UFOHUBX5B8N0M2V4C24h","UFOHUBX7N2M4V6C8X24h","UFOHUBX9M4V6C8X0Z24h",
"UFOHUBX1V3C5X7Z9B24h","UFOHUBX2C4X6Z8B0N24h","UFOHUBX3X6Z8B0N2M24h","UFOHUBX4Z7B9N1M3V24h",
"UFOHUBX5N9M1V3C5X24h","UFOHUBX6M1V3C5X7Z24h","UFOHUBX7V3C5X7Z9B24h","UFOHUBX8C5X7Z9B1N24h",
"UFOHUBX9X7Z9B1N3M24h","UFOHUBX0Z9B1N3M5V24h","UFOHUBX1B1N3M5V7C24h","UFOHUBX2N3M5V7C9X24h",
"UFOHUBX3M5V7C9X1Z24h","UFOHUBX4V7C9X1Z3B24h","UFOHUBX5C9X1Z3B5N24h","UFOHUBX6X1Z3B5N7M24h",
"UFOHUBX7Z3B5N7M9V24h","UFOHUBX8B5N7M9V1C24h","UFOHUBX9N7M9V1C3X24h","UFOHUBX0M9V1C3X5Z24h",
"UFOHUBX1V1C3X5Z7B24h","UFOHUBX2C3X5Z7B9N24h","UFOHUBX3X5Z7B9N1M24h","UFOHUBX4Z7B9N1M3V24h",
"UFOHUBX5B9N1M3V5C24h","UFOHUBX6N1M3V5C7X24h","UFOHUBX7M3V5C7X9Z24h","UFOHUBX8V5C7X9Z1B24h",
"UFOHUBX9C7X9Z1B3N24h","UFOHUBX0X9Z1B3N5M24h","UFOHUBX1Z1B3N5M7V24h","UFOHUBX2B3N5M7V9C24h",
"UFOHUBX3N5M7V9C1X24h","UFOHUBX4M7V9C1X3Z24h","UFOHUBX5V9C1X3Z5B24h","UFOHUBX6C1X3Z5B7N24h",
"UFOHUBX7X3Z5B7N9M24h","UFOHUBX8Z5B7N9M1V24h","UFOHUBX9B7N9M1V3C24h","UFOHUBX1H049FTRA024h",
"UFOHUBX7GB158W98N24h","UFOHUBXLQ7T871OFY24h","UFOHUBXZPPK52HC8G24h","UFOHUBXBO6IC0I7MM24h",
}

-- ทำเป็น set สำหรับเช็คเร็ว
local NORMAL_SET = {}
for _,k in ipairs(NORMAL_KEYS) do NORMAL_SET[k] = true end

------------------------ HELPERS -------------------------
local function stroke(obj, color, thick) local s=Instance.new("UIStroke",obj); s.Color=color; s.Thickness=thick or 2; return s end
local function round(obj, r) local u=Instance.new("UICorner",obj); u.CornerRadius=UDim.new(0,r or 12); return u end
local function center(frame) frame.AnchorPoint=Vector2.new(0.5,0.5); frame.Position=UDim2.fromScale(0.5,0.5) end

-- ลากแบบสมูท
local function enableDrag(handle, target)
	handle.Active = true; target.Active=true
	local dragging=false; local dragStart; local startPos
	handle.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=true; dragStart=i.Position; startPos=target.Position
			i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then dragging=false end end)
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
			local d=i.Position-dragStart
			local goal=UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
			TweenService:Create(target, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position=goal}):Play()
			STORE_DATA.lastPos = {goal.X.Scale,goal.X.Offset,goal.Y.Scale,goal.Y.Offset}
			saveStore(STORE_DATA)
		end
	end)
end

------------------------ KEY VALIDATION -------------------
local function keyStatus()
	if STORE_DATA.perm then return true,"PERM" end
	if STORE_DATA.session then return true,"SESSION" end
	if STORE_DATA.expire and os.time() < STORE_DATA.expire then return true,"24H" end
	return false
end

local function applyKey(k)
	if k=="PanuphongArtphairin" then
		STORE_DATA.perm=true; STORE_DATA.session=nil; STORE_DATA.expire=nil; saveStore(STORE_DATA); return true,"PERM"
	elseif k=="JJJMAX" then
		STORE_DATA.session=true; STORE_DATA.perm=nil; STORE_DATA.expire=nil; saveStore(STORE_DATA); return true,"SESSION"
	elseif NORMAL_SET[k] then
		STORE_DATA.expire=os.time()+86400; STORE_DATA.perm=nil; STORE_DATA.session=nil; saveStore(STORE_DATA); return true,"24H"
	end
	return false
end

------------------------ KEY UI --------------------------
local function showKeyUI(onOK)
	-- ถ้ามีสิทธิ์แล้ว ข้าม
	local ok,typ = keyStatus()
	if ok then onOK(typ) return end

	local gui = Instance.new("ScreenGui", pg)
	gui.Name="UFOX_KEY_UI"; gui.DisplayOrder=5000; gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

	local dim = Instance.new("Frame", gui)
	dim.BackgroundColor3 = Color3.new(0,0,0); dim.BackgroundTransparency=0.25; dim.Size=UDim2.fromScale(1,1)

	local card = Instance.new("Frame", gui)
	card.Size=UDim2.fromOffset(740, 420); center(card)
	card.BackgroundColor3=BLACK; round(card,16); stroke(card, GREEN, 2)

	-- Header
	local head = Instance.new("Frame", card)
	head.Size=UDim2.new(1,-24,0,62); head.Position=UDim2.fromOffset(12,10); head.BackgroundTransparency=1

	local logo = Instance.new("ImageLabel", head)
	logo.Image=LOGO; logo.BackgroundTransparency=1; logo.Size=UDim2.fromOffset(38,38); logo.Position=UDim2.fromOffset(0,12)

	local keyTitle = Instance.new("TextLabel", head)
	keyTitle.BackgroundTransparency=1
	keyTitle.TextXAlignment=Enum.TextXAlignment.Left
	keyTitle.Font=Enum.Font.GothamBold; keyTitle.TextSize=20; keyTitle.TextColor3=TXT
	keyTitle.Text = "KEY SYSTEM · เข้าสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)"
	keyTitle.Position=UDim2.fromOffset(46,10); keyTitle.Size=UDim2.new(1,-120,1,-10)

	local close = Instance.new("TextButton", head)
	close.Text="✕"; close.BackgroundColor3=RED; close.TextColor3=WHITE; close.Font=Enum.Font.GothamBold; close.TextSize=22
	close.Size=UDim2.fromOffset(42,42); close.Position=UDim2.new(1,-46,0,10); round(close,10)
	close.AutoButtonColor=true
	close.MouseButton1Click:Connect(function() gui:Destroy() end)

	-- Title UFO HUB X (ใหญ่ กลาง)
	local title = Instance.new("TextLabel", card)
	title.RichText=true; title.BackgroundTransparency=1; title.TextScaled=false
	title.Font=Enum.Font.GothamBlack; title.TextSize=32
	title.Text = '<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'
	title.TextColor3 = WHITE; title.Size=UDim2.new(1,0,0,40)
	title.AnchorPoint=Vector2.new(0.5,0); title.Position=UDim2.new(0.5,0,0,80)

	-- Input
	local input = Instance.new("TextBox", card)
	input.Size=UDim2.new(1,-44,0,48); input.Position=UDim2.fromOffset(22,130)
	input.BackgroundColor3=SOFT; input.TextColor3=TXT; input.PlaceholderColor3=TXT2; input.PlaceholderText="ใส่คีย์ที่นี่"
	input.Font=Enum.Font.Gotham; input.TextSize=17; round(input,12); stroke(input, GREEN,2)

	-- Submit
	local submit = Instance.new("TextButton", card)
	submit.Text="Submit Key  ➜"; submit.Font=Enum.Font.GothamBlack; submit.TextSize=20; submit.TextColor3=WHITE
	submit.Size=UDim2.new(1,-44,0,54); submit.Position=UDim2.fromOffset(22,190)
	submit.BackgroundColor3=SOFT; round(submit,12); stroke(submit, GREEN,2)

	-- Bottom buttons row
	local row = Instance.new("Frame", card)
	row.BackgroundTransparency=1; row.Size=UDim2.new(1,-44,0,62); row.Position=UDim2.new(0,22,1,-82)

	local getKey = Instance.new("TextButton", row)
	getKey.Text="🔑 Get Key"; getKey.Font=Enum.Font.GothamSemibold; getKey.TextSize=18; getKey.TextColor3=WHITE
	getKey.BackgroundColor3=SOFT; getKey.Size=UDim2.fromOffset(300,58); round(getKey,12); stroke(getKey,GREEN,2)

	local discord = Instance.new("TextButton", row)
	discord.Text="💬 Discord"; discord.Font=Enum.Font.GothamSemibold; discord.TextSize=18; discord.TextColor3=WHITE
	discord.BackgroundColor3=SOFT; discord.Size=UDim2.fromOffset(300,58); round(discord,12); stroke(discord,GREEN,2)
	discord.AnchorPoint=Vector2.new(1,0); discord.Position=UDim2.new(1,0,0,0)

	-- open links via setclipboard (เข้ากับ executor ทุกเจ้า)
	local KEY_LINK = "https://linkunlocker.com/ufo-hub-x-wKfUt"
	local DISCORD  = "https://discord.gg/JFHuVVVQ6D"
	local function toast(msg) pcall(function() StarterGui:SetCore("SendNotification",{Title="UFO HUB X",Text=msg,Duration=4}) end) end
	getKey.MouseButton1Click:Connect(function()
		if setclipboard then setclipboard(KEY_LINK); toast("คัดลอกลิงก์ Get Key แล้ว! วางในเบราว์เซอร์ได้เลย") end
	end)
	discord.MouseButton1Click:Connect(function()
		if setclipboard then setclipboard(DISCORD); toast("คัดลอกลิงก์ Discord แล้ว!") end
	end)

	submit.MouseButton1Click:Connect(function()
		local ok,typ = applyKey(input.Text)
		if ok then
			TweenService:Create(card, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size=UDim2.fromOffset(740,0)}):Play()
			task.wait(0.15); gui:Destroy()
			onOK(typ)
		else
			input.Text=""; input.PlaceholderText="❌ คีย์ไม่ถูกต้อง"; stroke(input,RED,2)
			task.delay(0.4,function() for _,c in ipairs(input:GetChildren()) do if c:IsA("UIStroke") then c.Color=GREEN end end end)
		end
	end)
end

------------------------ SPLASH / LOADING ----------------
local function showSplash(onDone)
	local gui = Instance.new("ScreenGui", pg); gui.Name="UFOX_SPLASH"; gui.DisplayOrder=4000
	local dim = Instance.new("Frame", gui); dim.Size=UDim2.fromScale(1,1); dim.BackgroundColor3=Color3.new(0,0,0)

	local card = Instance.new("Frame", gui); card.Size=UDim2.fromOffset(540, 200); center(card)
	card.BackgroundColor3=BLACK; round(card,18); stroke(card, GREEN,2)

	local title = Instance.new("TextLabel", card)
	title.RichText=true; title.BackgroundTransparency=1; title.Font=Enum.Font.GothamBlack; title.TextSize=24
	title.Text = "🚀  Loading <font color=\"#16F77B\">UFO</font> <font color=\"#FFFFFF\">HUB X</font>"
	title.TextColor3=WHITE; title.Size=UDim2.new(1,0,0,34); title.Position=UDim2.fromOffset(0,24)

	-- Bar
	local bar = Instance.new("Frame", card); bar.Size=UDim2.new(1,-80,0,20); bar.Position=UDim2.fromOffset(40,90)
	bar.BackgroundColor3=SOFT; round(bar,10); stroke(bar,WHITE,2)
	local fill = Instance.new("Frame", bar); fill.Size=UDim2.new(0,0,1,0); fill.BackgroundColor3=GREEN; round(fill,10)

	-- Rocket
	local rocket = Instance.new("TextLabel", card)
	rocket.BackgroundTransparency=1; rocket.Text="🚀"; rocket.Font=Enum.Font.GothamBlack; rocket.TextSize=28
	rocket.Position=UDim2.fromOffset(38,82)

	-- Percent
	local percent = Instance.new("TextLabel", card)
	percent.BackgroundTransparency=1; percent.Text="0%"; percent.Font=Enum.Font.GothamBold; percent.TextSize=22
	percent.TextColor3=WHITE; percent.Position=UDim2.fromOffset(0,130); percent.Size=UDim2.new(1,0,0,28)

	-- Animate 4.5s
	local steps = 100; local dur=4.5
	for i=0,steps do
		local a = i/steps
		fill.Size = UDim2.new(a,0,1,0)
		local px = bar.AbsolutePosition.X + bar.AbsoluteSize.X * a
		rocket.Position = UDim2.fromOffset((px - card.AbsolutePosition.X) - 8, 82)
		percent.Text = tostring(math.floor(a*100)).."%"
		task.wait(dur/steps)
	end
	task.wait(0.15)
	gui:Destroy()
	if onDone then onDone() end
end

------------------------ MAIN UI -------------------------
local singleton = nil
local toggleBtn = nil

local function buildMainUI()
	if singleton and singleton.Parent then return singleton end

	local gui = Instance.new("ScreenGui", pg); gui.Name="UFOX_MAIN"; gui.DisplayOrder=3000
	singleton = gui

	-- Toggle (ปุ่มลอย เล็กลง, ลากได้)
	toggleBtn = Instance.new("ImageButton", gui)
	toggleBtn.Image = LOGO; toggleBtn.BackgroundColor3=SOFT; round(toggleBtn,14); stroke(toggleBtn,WHITE,2)
	toggleBtn.Size=UDim2.fromOffset(84,84); toggleBtn.Position=UDim2.new(0,24,0.5,-42); toggleBtn.AutoButtonColor=true
	enableDrag(toggleBtn, toggleBtn)

	-- Window
	local win = Instance.new("Frame", gui)
	win.Size=UDim2.fromOffset(820, 440)
	if STORE_DATA.lastPos then
		win.Position = UDim2.new(STORE_DATA.lastPos[1], STORE_DATA.lastPos[2], STORE_DATA.lastPos[3], STORE_DATA.lastPos[4])
	else center(win) end
	win.BackgroundColor3=BG; round(win,16); stroke(win, WHITE,2)

	-- Header
	local head = Instance.new("Frame", win); head.Size=UDim2.new(1,0,0,56); head.BackgroundColor3=BLACK; round(head,16)
	local logo = Instance.new("ImageLabel", head); logo.Image=LOGO; logo.Size=UDim2.fromOffset(32,32); logo.Position=UDim2.fromOffset(14,12); logo.BackgroundTransparency=1
	local title = Instance.new("TextLabel", head)
	title.RichText=true; title.BackgroundTransparency=1; title.Font=Enum.Font.GothamBlack; title.TextSize=22; title.TextXAlignment=Enum.TextXAlignment.Left
	title.Text = '<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'
	title.TextColor3=WHITE; title.Position=UDim2.fromOffset(54,14); title.Size=UDim2.new(1,-140,1,-14)

	local close = Instance.new("TextButton", head)
	close.Text="✕"; close.BackgroundColor3=RED; close.TextColor3=WHITE; close.Font=Enum.Font.GothamBold; close.TextSize=20
	close.Size=UDim2.fromOffset(40,40); close.Position=UDim2.new(1,-50,0.5,-20); round(close,10)

	enableDrag(head, win)

	-- Tabs
	local tabs = Instance.new("Frame", win); tabs.BackgroundTransparency=1; tabs.Position=UDim2.fromOffset(14,64); tabs.Size=UDim2.new(1,-28,0,44)
	local list = Instance.new("UIListLayout", tabs); list.FillDirection=Enum.FillDirection.Horizontal; list.Padding=UDim.new(0,8)
	local tabNames = {"หน้าหลัก","ผู้เล่น","ภาพ/แสง","เทเลพอร์ต","ตั้งค่า","เครดิต"}
	local pages = {}

	local content = Instance.new("Frame", win); content.Position=UDim2.fromOffset(14,114); content.Size=UDim2.new(1,-28,1,-128)
	content.BackgroundColor3=SOFT; round(content,12); stroke(content,WHITE,2)

	-- สองซีก
	local left = Instance.new("Frame", content); left.BackgroundColor3=BG; stroke(left,WHITE,1); round(left,10)
	left.Size=UDim2.new(0.48,0,1,-16); left.Position=UDim2.fromOffset(8,8)
	local right = Instance.new("Frame", content); right.BackgroundColor3=BG; stroke(right,WHITE,1); round(right,10)
	right.Size=UDim2.new(0.48,0,1,-16); right.Position=UDim2.new(1,-right.Size.X.Offset-8,0,8); right.AnchorPoint=Vector2.new(1,0)

	-- สร้างแท็บ
	local current
	local function switchTo(name)
		if current==name then return end
		current=name
		-- (พื้นที่สำหรับใส่ฟังก์ชันจริงภายหลัง) ตอนนี้โชว์หัวข้อเพียว ๆ
		for _,c in ipairs(left:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
		for _,c in ipairs(right:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end

		local lblL = Instance.new("TextLabel", left); lblL.BackgroundTransparency=1; lblL.TextColor3=GREEN; lblL.Font=Enum.Font.GothamBold; lblL.TextSize=16
		lblL.Position=UDim2.fromOffset(12,10); lblL.Text = "• "..name.." (ซ้าย)"

		local lblR = Instance.new("TextLabel", right); lblR.BackgroundTransparency=1; lblR.TextColor3=GREEN; lblR.Font=Enum.Font.GothamBold; lblR.TextSize=16
		lblR.Position=UDim2.fromOffset(12,10); lblR.Text = "• "..name.." (ขวา)"
	end

	local function makeTab(name)
		local b=Instance.new("TextButton", tabs); b.Text=name; b.TextSize=16; b.Font=Enum.Font.GothamSemibold; b.TextColor3=TXT
		b.BackgroundColor3=SOFT; b.Size=UDim2.fromOffset(122,44); round(b,10); stroke(b,WHITE,1)
		b.MouseButton1Click:Connect(function()
			for _,bb in ipairs(tabs:GetChildren()) do if bb:IsA("TextButton") then bb.TextColor3=TXT end end
			b.TextColor3=GREEN; switchTo(name)
		end)
	end

	for _,n in ipairs(tabNames) do makeTab(n) end
	switchTo("หน้าหลัก")

	-- show/hide smooth
	local function showWin()
		win.Visible=true
		TweenService:Create(win, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency=0}):Play()
	end
	local function hideWin()
		TweenService:Create(win, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency=0.1}):Play()
		task.wait(0.16); win.Visible=false
	end
	toggleBtn.MouseButton1Click:Connect(function()
		if win.Visible then hideWin() else showWin() end
	end)
	close.MouseButton1Click:Connect(function() hideWin() end)

	return gui
end

------------------------ BOOT FLOW -----------------------
local function start()
	showKeyUI(function(kind)
		showSplash(function()
			buildMainUI()
			pcall(function() StarterGui:SetCore("SendNotification",{Title="UFO HUB X",Text="พร้อมใช้งาน ("..kind..")",Duration=4}) end)
		end)
	end)
end

start()
