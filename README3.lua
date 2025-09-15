-- UFO HUB X • Part 1/3
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
local function notify(msg)
	pcall(function() StarterGui:SetCore("SendNotification",{Title="UFO HUB X",Text=msg,Duration=5}) end)
end
local function center(gui) gui.AnchorPoint=Vector2.new(0.5,0.5); gui.Position=UDim2.fromScale(0.5,0.5) end
local function smoothDrag(handle, frame)
	local drag, startPos, startInput
	handle.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			drag=true; startInput=i; startPos=frame.Position
		end
	end)
	handle.InputEnded:Connect(function(i) if i==startInput then drag=false end end)
	UIS.InputChanged:Connect(function(i)
		if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
			local d=i.Position-startInput.Position
			frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
		end
	end)
end

-- Storage
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

-- Keys
local NORMAL_KEYS = {"UFOHUBXDMF9YK0XZM24h","UFOHUBX70OJIR4IF124h"} -- ตัดสั้นเพื่อสาธิต (ใส่ครบ 100 ได้)
local NORMAL_SET={} for _,k in ipairs(NORMAL_KEYS) do NORMAL_SET[k]=true end

local function validateKey(inputKey)
	local s=readStore()
	if s.perm then return true end
	if s.session then return true end
	if s.expire and os.time()<s.expire then return true end
	if inputKey=="PanuphongArtphairin" then s.perm=true; writeStore(s); return true end
	if inputKey=="JJJMAX" then s.session=true; writeStore(s); return true end
	if NORMAL_SET[inputKey] then s.expire=os.time()+86400; writeStore(s); return true end
	return false
end

-- Key UI
local function showKeyUI(onOK)
	local gui=Instance.new("ScreenGui",pg); gui.Name="UFOX_KEY_UI"; gui.DisplayOrder=2000
	local dim=Instance.new("Frame",gui); dim.Size=UDim2.fromScale(1,1); dim.BackgroundColor3=BLACK; dim.BackgroundTransparency=0.4
	local card=Instance.new("Frame",gui); card.Size=UDim2.fromOffset(600,340); center(card); card.BackgroundColor3=CARD_BG
	Instance.new("UICorner",card).CornerRadius=UDim.new(0,16)
	local stroke=Instance.new("UIStroke",card); stroke.Color=GREEN; stroke.Thickness=2

	local header=Instance.new("Frame",card); header.Size=UDim2.new(1,-24,0,54); header.Position=UDim2.fromOffset(12,12); header.BackgroundTransparency=1
	local logo=Instance.new("ImageLabel",header); logo.Image=LOGO_ID; logo.Size=UDim2.fromOffset(34,34); logo.Position=UDim2.fromOffset(4,10); logo.BackgroundTransparency=1
	local title=Instance.new("TextLabel",header); title.Text="KEY SYSTEM · เข้าสคริปต์ต้องมีคีย์ (24 ชม.)"; title.Size=UDim2.new(1,-60,1,0)
	title.Position=UDim2.fromOffset(46,0); title.TextColor3=TXT; title.TextSize=18; title.Font=Enum.Font.GothamBold; title.BackgroundTransparency=1; title.TextXAlignment=Enum.TextXAlignment.Left
	local close=Instance.new("TextButton",header); close.Text="✕"; close.Size=UDim2.fromOffset(40,40); close.Position=UDim2.new(1,-40,0,8)
	close.BackgroundColor3=Color3.fromRGB(36,40,46); close.Font=Enum.Font.GothamBold; close.TextSize=20; close.TextColor3=TXT
	Instance.new("UICorner",close).CornerRadius=UDim.new(0,8); local cs=Instance.new("UIStroke",close); cs.Color=GREEN; cs.Thickness=2
	close.MouseEnter:Connect(function() close.BackgroundColor3=RED; close.TextColor3=WHITE end)
	close.MouseLeave:Connect(function() close.BackgroundColor3=Color3.fromRGB(36,40,46); close.TextColor3=TXT end)
	close.MouseButton1Click:Connect(function() gui:Destroy() end)

	local input=Instance.new("TextBox",card); input.PlaceholderText="ใส่คีย์ที่นี่"; input.Text=""; input.Size=UDim2.new(1,-40,0,44)
	input.Position=UDim2.fromOffset(20,90); input.BackgroundColor3=INPUTBG; input.TextColor3=TXT; input.PlaceholderColor3=TXT2; input.Font=Enum.Font.Gotham; input.TextSize=16
	Instance.new("UICorner",input).CornerRadius=UDim.new(0,12); local is=Instance.new("UIStroke",input); is.Color=GREEN; is.Thickness=2

	local submit=Instance.new("TextButton",card); submit.Text="Submit Key ➜"; submit.Size=UDim2.new(1,-40,0,46); submit.Position=UDim2.fromOffset(20,150)
	submit.BackgroundColor3=GREEN; submit.Font=Enum.Font.GothamBold; submit.TextSize=18; submit.TextColor3=BLACK
	Instance.new("UICorner",submit).CornerRadius=UDim.new(0,12); local ss=Instance.new("UIStroke",submit); ss.Color=GREEN; ss.Thickness=2

	local row=Instance.new("Frame",card); row.Size=UDim2.new(1,-40,0,60); row.Position=UDim2.new(0,20,1,-80); row.BackgroundTransparency=1
	local layout=Instance.new("UIListLayout",row); layout.FillDirection=Enum.FillDirection.Horizontal; layout.HorizontalAlignment=Enum.HorizontalAlignment.Center; layout.Padding=UDim.new(0,20)
	local function mkBtn(txt)
		local b=Instance.new("TextButton",row); b.Text=txt; b.Size=UDim2.fromOffset(200,50); b.BackgroundColor3=BLACK
		b.Font=Enum.Font.GothamSemibold; b.TextColor3=WHITE; b.TextSize=17; Instance.new("UICorner",b).CornerRadius=UDim.new(0,12)
		local st=Instance.new("UIStroke",b); st.Color=GREEN; st.Thickness=2; return b
	end
	local getKey=mkBtn("🔑 Get Key"); local disc=mkBtn("💬 Discord")
	getKey.MouseButton1Click:Connect(function() if setclipboard then setclipboard("https://linkunlocker.com/ufo-hub-x-wKfUt") end; notify("คัดลอกลิงก์แล้ว") end)
	disc.MouseButton1Click:Connect(function() if setclipboard then setclipboard("https://discord.gg/JFHuVVVQ6D") end; notify("คัดลอก Discord แล้ว") end)

	submit.MouseButton1Click:Connect(function()
		if validateKey(input.Text) then gui:Destroy(); if onOK then onOK() end
		else input.Text=""; input.PlaceholderText="❌ คีย์ไม่ถูกต้อง"; is.Color=RED; task.delay(0.4,function() is.Color=GREEN end) end
	end)
end

_G.__UFOX_FULL_API = {showKeyUI=showKeyUI,smoothDrag=smoothDrag,theme={GREEN=GREEN,WHITE=WHITE,LOGO_ID=LOGO_ID,TXT=TXT}}
