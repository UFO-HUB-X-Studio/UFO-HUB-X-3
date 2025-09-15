--========================================================
-- UFO HUB X • One-File Pack (Key -> Splash -> Main UI)
-- Theme: Black/Alien Green • Executor-friendly
--========================================================

---------------------------
-- 0) GUARD & SERVICES
---------------------------
if _G.__UFOX_BOOT then return end
_G.__UFOX_BOOT = true

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS          = game:GetService("UserInputService")
local RunService   = game:GetService("RunService")
local StarterGui   = game:GetService("StarterGui")

local lp = Players.LocalPlayer or Players.PlayerAdded:Wait()
local pg = lp:WaitForChild("PlayerGui")

---------------------------
-- 1) THEME
---------------------------
local GREEN   = Color3.fromRGB(22,247,123)
local GREEN2  = Color3.fromRGB(120,255,195)
local WHITE   = Color3.fromRGB(255,255,255)
local BLACK   = Color3.fromRGB(0,0,0)
local BG_DARK = Color3.fromRGB(12,14,16)
local CARD_BG = Color3.fromRGB(18,20,24)
local INPUTBG = Color3.fromRGB(32,36,42)
local TXT     = Color3.fromRGB(235,240,245)
local TXT2    = Color3.fromRGB(170,180,190)
local RED     = Color3.fromRGB(235,70,85)

local LOGO_ID = "rbxassetid://106029438403666"

---------------------------
-- 2) STORAGE (24h / perm)
---------------------------
local PATH = "UFOX_KEY_STORE.json"
local haveFS = (writefile and isfile and readfile) and true or false

local function readStore()
    if haveFS and isfile(PATH) then
        local ok, data = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile(PATH)) end)
        if ok and typeof(data)=="table" then return data end
    end
    _G.__UFOX_MEM = _G.__UFOX_MEM or {}
    return _G.__UFOX_MEM
end

local function writeStore(t)
    if haveFS then
        local ok = pcall(function()
            writefile(PATH, game:GetService("HttpService"):JSONEncode(t))
        end)
        if not ok then _G.__UFOX_MEM = t end
    else
        _G.__UFOX_MEM = t
    end
end

---------------------------
-- 3) KEY LIST / VALIDATOR
---------------------------
-- ใส่ “100 คีย์ปกติ” ที่เพื่อนให้มาก่อนหน้า (ครบ 100) ไว้ในชุดนี้:
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
"UFOHUBX7X3Z5B7N9M24h","UFOHUBX8Z5B7N9M1V24h","UFOHUBX9B7N9M1V3C24h","UFOHUBX0N9M1V3C5X24h",
"UFOHUBX1M1V3C5X7Z24h","UFOHUBX2V3C5X7Z9B24h","UFOHUBX3C5X7Z9B1N24h","UFOHUBX4X7Z9B1N3M24h",
"UFOHUBX5Z9B1N3M5V24h","UFOHUBX6B1N3M5V7C24h","UFOHUBX7N3M5V7C9X24h","UFOHUBX8M5V7C9X1Z24h",
"UFOHUBX9V7C9X1Z3B24h","UFOHUBX1H049FTRA024h","UFOHUBX7GB158W98N24h","UFOHUBXLQ7T871OFY24h",
"UFOHUBXZPPK52HC8G24h","UFOHUBXBO6IC0I7MM24h"
}

local NORMAL_SET = {}
for _,k in ipairs(NORMAL_KEYS) do NORMAL_SET[k]=true end

local function validateKey(inputKey)
    local s = readStore()
    -- Permanent already?
    if s.perm == true then return true, "PERM" end
    -- Session JJJMAX?
    if s.session_ok == true then return true, "SESSION" end
    -- Time-valid?
    if s.expire and os.time() < (s.expire or 0) then return true, "24H" end

    -- Fresh check
    if inputKey == "PanuphongArtphairin" then
        s.perm = true; s.expire = nil; s.session_ok = nil; writeStore(s)
        return true, "PERM"
    elseif inputKey == "JJJMAX" then
        s.session_ok = true; s.expire = nil; writeStore(s)
        return true, "SESSION"
    elseif NORMAL_SET[inputKey] then
        s.expire = os.time() + 24*60*60; s.session_ok = nil; writeStore(s)
        return true, "24H"
    end
    return false
end

---------------------------
-- 4) HELPERS
---------------------------
local function notify(t)
    pcall(function() StarterGui:SetCore("SendNotification", {Title="UFO HUB X", Text=t, Duration=5}) end)
end

local function centerOnScreen(gui)
    gui.AnchorPoint = Vector2.new(0.5,0.5)
    gui.Position = UDim2.fromScale(0.5,0.5)
end

local function smoothDrag(handle, frame)
    local dragging, startPos, startInput
    handle.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dragging = true; startInput = i; startPos = frame.Position
        end
    end)
    handle.InputEnded:Connect(function(i)
        if i == startInput then dragging=false end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d = i.Position - startInput.Position
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

---------------------------
-- 5) KEY UI
---------------------------
local function showKeyUI(onOK)
    local screen = Instance.new("ScreenGui", pg)
    screen.Name="UFOX_KEY_UI"; screen.IgnoreGuiInset=true; screen.DisplayOrder=2500; screen.ResetOnSpawn=false

    local dim = Instance.new("Frame", screen); dim.Size=UDim2.fromScale(1,1); dim.BackgroundColor3=BLACK; dim.BackgroundTransparency=0.3

    local card = Instance.new("Frame", screen)
    card.Size=UDim2.fromOffset(680,360); centerOnScreen(card)
    card.BackgroundColor3=CARD_BG; card.BorderSizePixel=0
    Instance.new("UICorner", card).CornerRadius=UDim.new(0,16)
    local st = Instance.new("UIStroke", card); st.Color=GREEN; st.Thickness=2; st.Transparency=0.25

    local header = Instance.new("Frame", card)
    header.Size=UDim2.new(1,-24,0,56); header.Position=UDim2.fromOffset(12,12)
    header.BackgroundTransparency=1

    local logo = Instance.new("ImageLabel", header)
    logo.Image=LOGO_ID; logo.BackgroundTransparency=1; logo.Size=UDim2.fromOffset(34,34); logo.Position=UDim2.fromOffset(4,11)

    local title = Instance.new("TextLabel", header)
    title.BackgroundTransparency=1; title.TextXAlignment=Enum.TextXAlignment.Left
    title.Font=Enum.Font.GothamBold; title.TextSize=18; title.TextColor3=TXT
    title.Position=UDim2.fromOffset(46,8); title.Size=UDim2.new(1,-120,1,-8); title.RichText=true
    title.Text = '<font color="#16F77B">KEY SYSTEM</font> · เข้าสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)'

    local closeBtn = Instance.new("TextButton", header)
    closeBtn.Text="✕"; closeBtn.Font=Enum.Font.GothamBold; closeBtn.TextSize=20; closeBtn.TextColor3=TXT
    closeBtn.Size=UDim2.fromOffset(40,40); closeBtn.Position=UDim2.new(1,-44,0,8)
    closeBtn.BackgroundColor3=Color3.fromRGB(38,42,48); closeBtn.AutoButtonColor=false
    Instance.new("UICorner", closeBtn).CornerRadius=UDim.new(0,10)
    local cbSt=Instance.new("UIStroke", closeBtn); cbSt.Color=WHITE; cbSt.Transparency=0.25
    closeBtn.MouseEnter:Connect(function() closeBtn.BackgroundColor3=RED; closeBtn.TextColor3=WHITE end)
    closeBtn.MouseLeave:Connect(function() closeBtn.BackgroundColor3=Color3.fromRGB(38,42,48); closeBtn.TextColor3=TXT end)
    closeBtn.MouseButton1Click:Connect(function() screen:Destroy() end)

    local sep = Instance.new("Frame", card); sep.Position=UDim2.fromOffset(12,66); sep.Size=UDim2.new(1,-24,0,1)
    sep.BackgroundColor3=Color3.fromRGB(70,78,88); sep.BackgroundTransparency=0.25

    local input = Instance.new("TextBox", card)
    input.PlaceholderText="insert your key here"; input.Text=""
    input.TextColor3=TXT; input.PlaceholderColor3=TXT2; input.BackgroundColor3=INPUTBG
    input.ClearTextOnFocus=false; input.Font=Enum.Font.Gotham; input.TextSize=16
    input.Size=UDim2.new(1,-40,0,44); input.Position=UDim2.fromOffset(20,96); input.BorderSizePixel=0
    Instance.new("UICorner", input).CornerRadius=UDim.new(0,12)
    local inSt=Instance.new("UIStroke", input); inSt.Color=GREEN; inSt.Thickness=2; inSt.Transparency=0.25

    local submit = Instance.new("TextButton", card)
    submit.Text="Submit Key  ➜"; submit.Font=Enum.Font.GothamBlack; submit.TextSize=18
    submit.TextColor3=Color3.fromRGB(25,32,28); submit.BackgroundColor3=GREEN
    submit.Size=UDim2.new(1,-40,0,48); submit.Position=UDim2.fromOffset(20,160)
    submit.AutoButtonColor=false; submit.BorderSizePixel=0
    Instance.new("UICorner", submit).CornerRadius=UDim.new(0,12)
    local sbSt=Instance.new("UIStroke", submit); sbSt.Color=GREEN2; sbSt.Transparency=0.3
    submit.MouseEnter:Connect(function() TweenService:Create(submit,TweenInfo.new(0.1),{BackgroundColor3=GREEN2}):Play() end)
    submit.MouseLeave:Connect(function() TweenService:Create(submit,TweenInfo.new(0.1),{BackgroundColor3=GREEN}):Play() end)

    local row = Instance.new("Frame", card); row.Size=UDim2.new(1,-40,0,56); row.Position=UDim2.new(0,20,1,-72); row.BackgroundTransparency=1
    local list = Instance.new("UIListLayout", row); list.FillDirection=Enum.FillDirection.Horizontal; list.HorizontalAlignment=Enum.HorizontalAlignment.Center; list.Padding=UDim.new(0,18)

    local function mkBigBtn(icon,label)
        local b=Instance.new("TextButton"); b.AutoButtonColor=false; b.BackgroundColor3=Color3.fromRGB(30,34,40)
        b.Size=UDim2.fromOffset(220,50); b.Text=icon.."  "..label; b.Font=Enum.Font.GothamSemibold; b.TextSize=17; b.TextColor3=TXT
        Instance.new("UICorner", b).CornerRadius=UDim.new(0,14); local st=Instance.new("UIStroke", b); st.Color=GREEN; st.Thickness=2; st.Transparency=0.25
        b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(36,40,48)}):Play() end)
        b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(30,34,40)}):Play() end)
        b.Parent=row; return b
    end

    local getKey = mkBigBtn("🔑","Get Key"); local disc = mkBigBtn("💬","Discord")
    local GET_URL = "https://linkunlocker.com/ufo-hub-x-wKfUt"
    local DISC_URL= "https://discord.gg/JFHuVVVQ6D"
    local function open(url) if setclipboard then setclipboard(url) end; notify("คัดลอกลิงก์แล้ว: "..url) end
    getKey.MouseButton1Click:Connect(function() open(GET_URL) end)
    disc.MouseButton1Click:Connect(function() open(DISC_URL) end)

    local function accept()
        TweenService:Create(card,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
        TweenService:Create(dim,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
        task.delay(0.21,function() screen:Destroy(); if onOK then onOK() end end)
    end

    -- ถ้าเก็บสิทธิ์ไว้แล้ว (perm/session/24h) ให้ข้ามเลย
    local okAlready = validateKey(nil)
    if okAlready then accept(); return end

    submit.MouseButton1Click:Connect(function()
        local ok = validateKey(input.Text)
        if ok then accept() else
            input.Text=""; input.PlaceholderText="คีย์ไม่ถูกต้อง ลองใหม่"; TweenService:Create(inSt,TweenInfo.new(0.12),{Color=RED}):Play()
            task.delay(0.25,function() TweenService:Create(inSt,TweenInfo.new(0.18),{Color=GREEN}):Play() end)
        end
    end)
end

---------------------------
-- 6) SPLASH / DOWNLOAD
---------------------------
local function showSplash(onDone)
    local screen = Instance.new("ScreenGui", pg)
    screen.Name="UFOX_SPLASH"; screen.IgnoreGuiInset=true; screen.DisplayOrder=2600; screen.ResetOnSpawn=false

    local bg = Instance.new("Frame", screen); bg.Size=UDim2.fromScale(1,1); bg.BackgroundColor3=BLACK

    local card = Instance.new("Frame", screen)
    card.Size=UDim2.fromOffset(560,300); centerOnScreen(card)
    card.BackgroundColor3=CARD_BG; card.BorderSizePixel=0; Instance.new("UICorner", card).CornerRadius=UDim.new(0,18)
    local st=Instance.new("UIStroke", card); st.Color=GREEN; st.Thickness=2; st.Transparency=0.25

    local logo=Instance.new("ImageLabel", card); logo.BackgroundTransparency=1; logo.Image=LOGO_ID; logo.Size=UDim2.fromOffset(96,96); logo.Position=UDim2.new(0.5,0,-0.02,14); logo.AnchorPoint=Vector2.new(0.5,0)

    local title=Instance.new("TextLabel", card); title.BackgroundTransparency=1; title.Size=UDim2.new(1,0,0,42); title.Position=UDim2.new(0,0,0,120)
    title.Font=Enum.Font.GothamBold; title.TextSize=30; title.TextXAlignment=Enum.TextXAlignment.Center; title.RichText=true
    title.Text='<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'; title.TextColor3=WHITE

    local barBG=Instance.new("Frame", card); barBG.Size=UDim2.new(1,-80,0,30); barBG.Position=UDim2.new(0.5,0,0,175); barBG.AnchorPoint=Vector2.new(0.5,0)
    barBG.BackgroundColor3=Color3.fromRGB(50,50,50); barBG.BorderSizePixel=0; Instance.new("UICorner", barBG).CornerRadius=UDim.new(0,12)
    local barStroke=Instance.new("UIStroke", barBG); barStroke.Color=WHITE; barStroke.Thickness=2; barStroke.Transparency=0.15

    local fill=Instance.new("Frame", barBG); fill.Size=UDim2.new(0,0,1,0); fill.BackgroundColor3=GREEN; fill.BorderSizePixel=0; Instance.new("UICorner", fill).CornerRadius=UDim.new(0,12)
    local rocket=Instance.new("TextLabel", barBG); rocket.BackgroundTransparency=1; rocket.Size=UDim2.fromOffset(28,28); rocket.AnchorPoint=Vector2.new(0.5,0.5); rocket.Text="🚀"; rocket.TextSize=22
    local pct=Instance.new("TextLabel", card); pct.BackgroundTransparency=1; pct.Size=UDim2.new(1,0,0,40); pct.Position=UDim2.new(0,0,0,215)
    pct.Font=Enum.Font.GothamBold; pct.TextSize=32; pct.TextColor3=WHITE; pct.TextXAlignment=Enum.TextXAlignment.Center; pct.Text="0%"

    local TOTAL=10; local LEAD=10; local start=tick()
    local function setp(p) p=math.clamp(p,0,1); fill.Size=UDim2.new(p,0,1,0); local w=barBG.AbsoluteSize.X; rocket.Position=UDim2.new(0.5, p*w - w/2 + LEAD, 0.5, 0); pct.Text=("%d%%"):format(p*100) end
    task.spawn(function()
        while true do
            local t=math.clamp((tick()-start)/TOTAL,0,1); local e=1-(1-t)^3; setp(e); if t>=1 then break end; task.wait()
        end
        task.wait(0.3)
        TweenService:Create(card,TweenInfo.new(0.45),{BackgroundTransparency=1}):Play()
        TweenService:Create(bg,TweenInfo.new(0.45),{BackgroundTransparency=1}):Play()
        task.delay(0.46,function() screen:Destroy(); if onDone then onDone() end end)
    end)
end

---------------------------
-- 7) MAIN UI (toggle + draggable + 2 คอลัมน์)
---------------------------
local function showMain()
    if _G.__UFOX_UI then return end
    _G.__UFOX_UI = true

    local s = Instance.new("ScreenGui", pg); s.Name="UFOX_UI"; s.IgnoreGuiInset=true; s.DisplayOrder=2700; s.ResetOnSpawn=false

    -- ปุ่มลอย เปิด/ปิด (ลากได้)
    local toggle = Instance.new("ImageButton", s)
    toggle.Image = LOGO_ID; toggle.BackgroundColor3=Color3.fromRGB(26,30,36); toggle.AutoButtonColor=false
    toggle.Size=UDim2.fromOffset(84,84); toggle.Position=UDim2.fromOffset(24, (pg.AbsoluteSize.Y/2) - 42)
    Instance.new("UICorner", toggle).CornerRadius=UDim.new(0,20)
    local tSt=Instance.new("UIStroke", toggle); tSt.Color=WHITE; tSt.Transparency=0.3; tSt.Thickness=2
    smoothDrag(toggle,toggle)

    local win = Instance.new("Frame", s)
    win.Size=UDim2.fromOffset(900,420); centerOnScreen(win)
    win.BackgroundColor3=Color3.fromRGB(19,22,26); win.BorderSizePixel=0; Instance.new("UICorner", win).CornerRadius=UDim.new(0,14)
    local wSt=Instance.new("UIStroke", win); wSt.Color=WHITE; wSt.Transparency=0.25; wSt.Thickness=2

    local header = Instance.new("Frame", win); header.Size=UDim2.new(1,0,0,50); header.BackgroundColor3=Color3.fromRGB(24,27,32); header.BorderSizePixel=0
    Instance.new("UICorner", header).CornerRadius=UDim.new(0,14)

    local logo = Instance.new("ImageLabel", header); logo.Image=LOGO_ID; logo.BackgroundTransparency=1; logo.Size=UDim2.fromOffset(28,28); logo.Position=UDim2.fromOffset(12,11)
    local title = Instance.new("TextLabel", header); title.BackgroundTransparency=1; title.RichText=true; title.TextXAlignment=Enum.TextXAlignment.Left
    title.Font=Enum.Font.GothamBold; title.TextSize=20; title.Text = '<font color="#16F77B">UFO</font> <font color="#FFFFFF">HUB X</font>'
    title.Position=UDim2.fromOffset(48,11); title.Size=UDim2.new(1,-100,0,28)

    local close = Instance.new("TextButton", header)
    close.Text="✕"; close.Font=Enum.Font.GothamBold; close.TextSize=18; close.TextColor3=TXT; close.AutoButtonColor=false
    close.Size=UDim2.fromOffset(34,34); close.Position=UDim2.new(1,-42,0,8); close.BackgroundColor3=Color3.fromRGB(36,40,46)
    Instance.new("UICorner", close).CornerRadius=UDim.new(0,8)
    close.MouseEnter:Connect(function() close.BackgroundColor3=RED; close.TextColor3=WHITE end)
    close.MouseLeave:Connect(function() close.BackgroundColor3=Color3.fromRGB(36,40,46); close.TextColor3=TXT end)
    close.MouseButton1Click:Connect(function() win.Visible=false end)

    smoothDrag(header, win)

    -- แท็บ
    local tabs = Instance.new("Frame", win); tabs.Size=UDim2.new(1,-20,0,40); tabs.Position=UDim2.fromOffset(10,58); tabs.BackgroundTransparency=1
    local tl = Instance.new("UIListLayout", tabs); tl.FillDirection=Enum.FillDirection.Horizontal; tl.Padding=UDim.new(0,8); tl.HorizontalAlignment=Enum.HorizontalAlignment.Left

    local function mkTab(txt)
        local b=Instance.new("TextButton"); b.Text=txt; b.Font=Enum.Font.GothamSemibold; b.TextSize=14; b.TextColor3=TXT
        b.BackgroundColor3=Color3.fromRGB(28,32,38); b.AutoButtonColor=false; b.Size=UDim2.fromOffset(120,36)
        Instance.new("UICorner", b).CornerRadius=UDim.new(0,10); local st=Instance.new("UIStroke", b); st.Color=WHITE; st.Transparency=0.35
        b.MouseEnter:Connect(function() b.BackgroundColor3=Color3.fromRGB(32,36,42) end)
        b.MouseLeave:Connect(function() b.BackgroundColor3=Color3.fromRGB(28,32,38) end)
        b.Parent=tabs; return b
    end

    local tHome=mkTab("หน้าหลัก"); local tPlayer=mkTab("ผู้เล่น"); local tVisual=mkTab("ภาพ/แสง"); local tTP=mkTab("เทเลพอร์ต"); local tSettings=mkTab("ตั้งค่า"); local tCredit=mkTab("เครดิต")

    -- พื้นที่ 2 คอลัมน์
    local body = Instance.new("Frame", win); body.Size=UDim2.new(1,-20,1,-110); body.Position=UDim2.fromOffset(10,106); body.BackgroundTransparency=1
    local colL = Instance.new("Frame", body); colL.Size=UDim2.new(0.5,-6,1,0); colL.BackgroundColor3=Color3.fromRGB(24,27,32); Instance.new("UICorner", colL).CornerRadius=UDim.new(0,10)
    local colR = Instance.new("Frame", body); colR.Size=UDim2.new(0.5,-6,1,0); colR.Position=UDim2.new(0.5,6,0,0); colR.BackgroundColor3=Color3.fromRGB(24,27,32); Instance.new("UICorner", colR).CornerRadius=UDim.new(0,10)
    local cSt1=Instance.new("UIStroke", colL); cSt1.Color=WHITE; cSt1.Transparency=0.35
    local cSt2=Instance.new("UIStroke", colR); cSt2.Color=WHITE; cSt2.Transparency=0.35

    -- ตัวอย่างข้อความ (เพื่อนจะเติมฟังก์ชันจริงเอง)
    local l=Instance.new("TextLabel", colL); l.BackgroundTransparency=1; l.TextColor3=GREEN; l.Font=Enum.Font.GothamSemibold; l.TextSize=14; l.TextXAlignment=Enum.TextXAlignment.Left; l.Position=UDim2.fromOffset(10,10); l.Size=UDim2.new(1,-20,0,20); l.Text="• ช่องซ้าย (ใส่ปุ่ม/สไลเดอร์ที่นี่)"
    local r=Instance.new("TextLabel", colR); r.BackgroundTransparency=1; r.TextColor3=GREEN; r.Font=Enum.Font.GothamSemibold; r.TextSize=14; r.TextXAlignment=Enum.TextXAlignment.Left; r.Position=UDim2.fromOffset(10,10); r.Size=UDim2.new(1,-20,0,20); r.Text="• ช่องขวา (ใส่ปุ่ม/สไลเดอร์ที่นี่)"

    -- toggle show/hide + จำตำแหน่ง
    local lastPos
    local function show() win.Visible=true; if lastPos then win.Position=lastPos end end
    local function hide() lastPos = win.Position; win.Visible=false end
    toggle.MouseButton1Click:Connect(function() if win.Visible then hide() else show() end end)

    -- api เผื่อ splash เรียก
    _G.__UFOX_UI_OBJ = {api={show=show, hide=hide}}
end

---------------------------
-- 8) BOOT FLOW
---------------------------
local function boot()
    showKeyUI(function()
        showSplash(function()
            showMain()
        end)
    end)
end

boot()
