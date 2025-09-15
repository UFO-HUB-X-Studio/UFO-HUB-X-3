--[[
  UFO HUB X — Key System (Alien Style)
  - ใช้เป็น "สคริปต์รัน" บนตัวรัน (Delta X / KRNL / CodeX / Arceus X Neo)
  - ถ้าจะใช้แบบโหลดผ่าน URL ก็ได้: loadstring(game:HttpGet("..."))()
  - ผ่านคีย์แล้ว จะเรียก hook OnUnlocked() -> นายเอาไปต่อ Splash / UI หลักได้เลย

  ✅ คีย์พิเศษ:
     - "JJJMAX"              -> ผ่านทันที เฉพาะรอบนี้ (session)
     - "PanuphongArtphairin" -> ผ่านถาวร (persist)

  ✅ คีย์ปกติ (24 ชม.) -> ใส่จากรายการ whitelist (100 ตัวอย่าง)

  ✅ ที่อยู่ปุ่ม:
     Get Key   -> https://linkunlocker.com/ufo-hub-x-wKfUt
     Discord   -> https://discord.gg/JFHuVVVQ6D
--]]

-- ========== CONFIG ==========
local TITLE_LEFT   = "KEY SYSTEM · เข้าสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)"
local BRAND        = "UFO HUB X"
local LOGO_ID      = "rbxassetid://106029438403666" -- ไอคอนโลโก้
local GETKEY_URL   = "https://linkunlocker.com/ufo-hub-x-wKfUt"
local DISCORD_URL  = "https://discord.gg/JFHuVVVQ6D"

-- คีย์พิเศษ
local SPECIAL_ONCE = "JJJMAX"
local SPECIAL_PERM = "PanuphongArtphairin"

-- คีย์ปกติ 24 ชม. (ตัวอย่าง 100 ตัวตามที่นายให้)
local WHITELIST_24H = {
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

-- ลิงก์เปิดเบราว์เซอร์ (รองรับ executor ส่วนใหญ่)
local function openURL(url)
    local f = getsynasset or syn and syn.request or request or http_request
    if (syn and syn.open_url) then syn.open_url(url)
    elseif (f == request or f == http_request) and setclipboard then setclipboard(url)
    elseif setclipboard then setclipboard(url)
    end
end

-- ========== PERSIST HELPERS ==========
local function hasFS()
    return (writefile and readfile and isfile) and true or false
end

local STORE_FILE = "UFO_HUB_X/key_store.json"

local function readStore()
    local data = { mode="", key="", expires=0 } -- mode: "perm"|"24h"|"once"|""
    if hasFS() and isfile(STORE_FILE) then
        local ok, j = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile(STORE_FILE)) end)
        if ok and type(j)=="table" then
            for k,v in pairs(j) do data[k]=v end
        end
    end
    return data
end

local function writeStore(tbl)
    if not hasFS() then return end
    local ok, js = pcall(function() return game:GetService("HttpService"):JSONEncode(tbl) end)
    if ok then pcall(function() writefile(STORE_FILE, js) end) end
end

-- ========== VALIDATION ==========
local function inList(k)
    for i=1,#WHITELIST_24H do
        if WHITELIST_24H[i]==k then return true end
    end
    return false
end

local function now()
    return os.time()
end

local function validateKey(k)
    if not k or k=="" then return false,"กรุณาใส่คีย์" end
    if k==SPECIAL_PERM then
        return true,"perm"
    elseif k==SPECIAL_ONCE then
        return true,"once"
    elseif inList(k) then
        return true,"24h"
    else
        return false,"คีย์ไม่ถูกต้อง"
    end
end

-- ========== UI BUILD ==========
local Players = game:GetService("Players")
local lp      = Players.LocalPlayer
local pg      = lp:WaitForChild("PlayerGui")

-- กันซ้ำ
local old = pg:FindFirstChild("UFOX_KEY_UI")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "UFOX_KEY_UI"
gui.IgnoreGuiInset = true
gui.DisplayOrder = 9999
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = pg

local color = {
    bg     = Color3.fromRGB(17,18,20),
    card   = Color3.fromRGB(27,29,33),
    panel  = Color3.fromRGB(33,36,41),
    text   = Color3.fromRGB(232,235,238),
    sub    = Color3.fromRGB(178,186,194),
    green  = Color3.fromRGB(22,247,123),
    greenD = Color3.fromRGB(21,211,110),
    red    = Color3.fromRGB(235,70,85),
    stroke = Color3.fromRGB(120, 255, 180)
}

local function stroke(target, c, t)
    local s = Instance.new("UIStroke")
    s.Color = c or color.green
    s.Thickness = t or 2
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = target
    return s
end

local function corner(target, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 12)
    c.Parent = target
    return c
end

local root = Instance.new("Frame")
root.Size = UDim2.fromOffset(640, 360)
root.Position = UDim2.new(0.5,-320,0.5,-180)
root.BackgroundColor3 = color.card
root.BorderSizePixel = 0
root.Parent = gui
corner(root, 14)
stroke(root, color.green, 2)

-- เงา
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://5028857084"
shadow.ImageColor3 = Color3.new(0,0,0)
shadow.ImageTransparency = 0.3
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(24,24,276,276)
shadow.Size = UDim2.new(1, 60, 1, 60)
shadow.Position = UDim2.fromOffset(-30,-30)
shadow.Parent = root
shadow.ZIndex = 0

-- หัวการ์ด
local header = Instance.new("Frame")
header.Size = UDim2.new(1,0,0,64)
header.BackgroundColor3 = color.panel
header.BorderSizePixel = 0
header.Parent = root
corner(header, 12)

local hpad = Instance.new("UIPadding", header)
hpad.PaddingLeft = UDim.new(0,16)
hpad.PaddingRight= UDim.new(0,16)

-- โลโก้
local logo = Instance.new("ImageLabel")
logo.BackgroundTransparency = 1
logo.Image = LOGO_ID
logo.Size = UDim2.fromOffset(32,32)
logo.Position = UDim2.new(0,8,0.5,-16)
logo.Parent = header

-- ข้อความซ้าย (บรรทัดหัว)
local hText = Instance.new("TextLabel")
hText.BackgroundTransparency = 1
hText.AnchorPoint = Vector2.new(0,0.5)
hText.Position = UDim2.new(0,48,0.5,0)
hText.Size = UDim2.new(1,-120,1,-0)
hText.TextXAlignment = Enum.TextXAlignment.Left
hText.Font = Enum.Font.GothamMedium
hText.TextSize = 16
hText.TextColor3 = color.text
hText.Text = TITLE_LEFT
hText.Parent = header

-- ปุ่มปิด (กากบาท)
local closeBtn = Instance.new("TextButton")
closeBtn.AnchorPoint = Vector2.new(1,0.5)
closeBtn.Position = UDim2.new(1, -10, 0.5, 0)
closeBtn.Size = UDim2.fromOffset(36,36)
closeBtn.BackgroundColor3 = color.red
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.AutoButtonColor = true
closeBtn.Parent = header
corner(closeBtn, 10)
stroke(closeBtn, Color3.fromRGB(177,42,58), 2)

-- ชื่อกลางใหญ่ UFO HUB X
local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.5,0,0,76)
title.AnchorPoint = Vector2.new(0.5,0)
title.Size = UDim2.fromOffset(560,36)
title.Font = Enum.Font.GothamBlack
title.TextSize = 30
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Text = "UFO  HUB X"
title.TextColor3 = color.text
title.Parent = root

-- เน้นคำ UFO เป็นเขียว (ด้วย RichText)
title.RichText = true
title.Text = '<font color="#16F77B">UFO</font> HUB X'

-- กล่องฟอร์ม
local form = Instance.new("Frame")
form.Size = UDim2.new(1,-32,0,160)
form.Position = UDim2.new(0,16,0,120)
form.BackgroundTransparency = 1
form.Parent = root

local list = Instance.new("UIListLayout", form)
list.Padding = UDim.new(0,12)

-- TextBox ใส่คีย์
local box = Instance.new("TextBox")
box.Size = UDim2.new(1,0,0,44)
box.BackgroundColor3 = Color3.fromRGB(34,38,44)
box.TextColor3 = color.text
box.PlaceholderText = "insert your key here"
box.PlaceholderColor3 = color.sub
box.Font = Enum.Font.Gotham
box.TextSize = 16
box.ClearTextOnFocus = false
box.Parent = form
corner(box, 10)
stroke(box, color.green, 2)

-- ปุ่ม Submit
local submit = Instance.new("TextButton")
submit.Size = UDim2.new(1,0,0,48)
submit.BackgroundColor3 = color.green
submit.Font = Enum.Font.GothamBold
submit.TextSize = 18
submit.Text = "Submit Key  ➜"
submit.TextColor3 = Color3.fromRGB(15,16,18)
submit.Parent = form
corner(submit, 10)
stroke(submit, color.greenD, 2)

-- เส้นแบ่ง
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-32,0,1)
divider.Position = UDim2.new(0,16,1,-64)
divider.BackgroundColor3 = Color3.fromRGB(60,66,72)
divider.BorderSizePixel = 0
divider.Parent = root

-- ปุ่มล่าง 2 อัน
local bottom = Instance.new("Frame")
bottom.Size = UDim2.new(1,-32,0,56)
bottom.Position = UDim2.new(0,16,1,-56)
bottom.BackgroundTransparency = 1
bottom.Parent = root

local bList = Instance.new("UIListLayout", bottom)
bList.FillDirection = Enum.FillDirection.Horizontal
bList.Padding = UDim.new(0,14)
bList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function mkAction(text, icon)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.5,-7,1,0)
    b.BackgroundColor3 = Color3.fromRGB(30,34,40)
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 18
    b.TextColor3 = color.text
    b.Text = (icon or "").."  "..text
    b.AutoButtonColor = true
    corner(b, 12)
    stroke(b, color.green, 2)
    return b
end

local btnGet = mkAction("Get Key", "🔑")
btnGet.Parent = bottom
local btnDiscord = mkAction("Discord", "💬")
btnDiscord.Parent = bottom

-- Hover เอฟเฟกต์เบา ๆ
local TweenService = game:GetService("TweenService")
local function hoverify(btn)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(36,40,48)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(30,34,40)
        }):Play()
    end)
end
hoverify(btnGet); hoverify(btnDiscord)

-- ปุ่มลัดเปิดลิงก์
btnGet.MouseButton1Click:Connect(function() openURL(GETKEY_URL) end)
btnDiscord.MouseButton1Click:Connect(function() openURL(DISCORD_URL) end)

-- ปิด UI (ถ้าอยากหายถาวรก็ Destroy)
closeBtn.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

-- ========== DRAG ลื่น & กันเด้ง ==========
local UIS = game:GetService("UserInputService")
do
    local dragging, startPos, dragStart
    header.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dragging = true; dragStart = i.Position; startPos = root.Position
            i.Changed:Connect(function()
                if i.UserInputState==Enum.UserInputState.End then dragging=false end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local delta = i.Position - dragStart
            root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+delta.X, startPos.Y.Scale, startPos.Y.Offset+delta.Y)
        end
    end)
end

-- ========== LOGIC: โหลดค่าที่เซฟไว้ ==========
local store = readStore()
local unlocked = false

local function markUnlocked(m)
    unlocked = true
    -- เซฟสถานะ/เวลาหมดอายุ
    if m=="perm" then
        writeStore({mode="perm", key=SPECIAL_PERM, expires=0})
    elseif m=="24h" then
        writeStore({mode="24h", key=box.Text,  expires= now()+24*60*60})
    elseif m=="once" then
        -- session only: ไม่เขียนไฟล์
    end

    -- ปิด UI key และเรียก hook ต่อ
    TweenService:Create(root, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        BackgroundTransparency = 1
    }):Play()
    task.delay(0.18, function()
        gui:Destroy()
        -- ========= จุดเชื่อมต่อ UI หลัก =========
        -- ใส่โค้ด Splash/เมนูหลักของนายตรงนี้ได้เลย
        -- ตัวอย่าง:
        -- loadstring(game:HttpGet("https://raw.githubusercontent.com/UFO-HUB-X-Studio/UFO-HUB-X-2/refs/heads/main/README2.lua"))()
        -- หลังจากนั้นค่อยโหลด UI หลัก:
        -- loadstring(game:HttpGet("https://raw.githubusercontent.com/UFO-HUB-X-Studio/UFO-HUB-X-3/refs/heads/main/README3.lua"))()
    end)
end

-- ถ้ามี perm หรือยังไม่หมดอายุ -> ผ่านอัตโนมัติ
if store.mode=="perm" then
    markUnlocked("perm")
elseif store.mode=="24h" and type(store.expires)=="number" and store.expires>now() then
    markUnlocked("24h")
end

-- ========== ปุ่ม Submit ==========
local submitting = false
local function toast(msg, ok)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "UFO HUB X",
            Text  = msg,
            Duration = 3,
            Button1 = ok and "OK" or nil
        })
    end)
end

submit.MouseButton1Click:Connect(function()
    if submitting or unlocked then return end
    submitting = true
    local k = (box.Text or ""):gsub("^%s+",""):gsub("%s+$","")

    local ok, modeOrMsg = validateKey(k)
    if not ok then
        toast(modeOrMsg or "คีย์ไม่ถูกต้อง")
        submitting = false
        return
    end

    if modeOrMsg=="perm" then
        toast("ยืนยันคีย์ถาวรสำเร็จ ✔")
        markUnlocked("perm")

    elseif modeOrMsg=="once" then
        toast("คีย์รอบนี้สำเร็จ ✔ (เฉพาะครั้งนี้)")
        markUnlocked("once")

    elseif modeOrMsg=="24h" then
        toast("คีย์ 24 ชม. เปิดใช้งานแล้ว ✔")
        markUnlocked("24h")
    end
end)

-- ========== เปิดด้วยแอนิเมชันเล็ก ๆ ==========
root.BackgroundTransparency = 1
root.Position = UDim2.new(0.5,-320,0.5,-160)
TweenService:Create(root, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.5,-320,0.5,-180)
}):Play()
