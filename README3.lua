--[[  UFO HUB X — Key Module (UI Revamp)
     - drop-in for README3.lua
     - exports:  check({durationSec}), isValid(), prompt({...})
     - style: alien green, glass card, clear buttons, smooth tween
     - persists 24h with writefile / fallback to getgenv
]]]
local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local HttpService   = game:GetService("HttpService")
local UIS           = game:GetService("UserInputService")

local lp    = Players.LocalPlayer
local pgui  = lp:WaitForChild("PlayerGui")

-- ====== THEME ======
local ACCENT       = Color3.fromRGB(22,247,123)   -- เขียวเอเลี่ยน
local BASE_BG      = Color3.fromRGB(14,17,19)
local CARD_BG      = Color3.fromRGB(20,24,27)
local FIELD_BG     = Color3.fromRGB(27,32,36)
local TEXT_MAIN    = Color3.fromRGB(221,228,234)
local TEXT_SOFT    = Color3.fromRGB(160,168,176)
local WHITE        = Color3.fromRGB(255,255,255)

-- ====== STORAGE (24h) ======
local FS      = (isfile and writefile and readfile and makefolder) and true or false
local DIR     = "UFO_HUB_X"
local FILE    = DIR.."/key.json"
local function now() return os.time() end

local function save(obj)
    if FS then
        pcall(makefolder, DIR)
        pcall(writefile, FILE, HttpService:JSONEncode(obj))
    else
        getgenv().__UFOX_KEYCACHE = obj
    end
end
local function load()
    if FS and isfile(FILE) then
        local ok, s = pcall(readfile, FILE)
        if ok then
            local ok2, d = pcall(HttpService.JSONDecode, HttpService, s)
            if ok2 then return d end
        end
    end
    return rawget(getgenv(), "__UFOX_KEYCACHE")
end

-- ====== VALIDATION ======
-- ใส่คีย์ของนาย (ถ้าจะใช้แบบลิสต์ในตัวไฟล์) หรือปล่อยว่างแล้วใช้ opts.validate()
local VALID = rawget(getgenv(), "__UFOX_VALID_KEYS") or {} -- สามารถตั้งจากภายนอกได้

local function inList(k)
    for _,v in ipairs(VALID) do if v==k then return true end end
    return false
end

local durationDefault = 24*60*60

local M = {}

function M.isValid()
    local d = load()
    if not d or not d.key or not d.ts then return false end
    return (now()-d.ts) < (d.duration or durationDefault)
end

function M.check(cfg)
    local dur = (cfg and cfg.durationSec) or durationDefault
    local d = load()
    if d and d.key and d.ts and (now()-d.ts) < (d.duration or dur) then
        return true
    end
    return false, "no valid key"
end

-- ===== UI HELPERS =====
local function corner(inst, r) local c = Instance.new("UICorner", inst); c.CornerRadius = UDim.new(0,r or 12); return c end
local function stroke(inst, th, col, tr)
    local s = Instance.new("UIStroke", inst)
    s.Thickness = th or 1
    s.Color = col or Color3.fromRGB(255,255,255)
    s.Transparency = tr or 0.4
    return s
end
local function gradient(inst, c1, c2, rot)
    local g = Instance.new("UIGradient", inst)
    g.Color = ColorSequence.new(c1,c2)
    g.Rotation = rot or 0
    return g
end

local function makeCard(size)
    local gui = Instance.new("ScreenGui")
    gui.Name = "UFOX_KEYUI"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 2100
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = pgui

    local root = Instance.new("Frame", gui)
    root.BackgroundTransparency = 1
    root.Size = UDim2.fromScale(1,1)

    local card = Instance.new("Frame", root)
    card.Name = "Card"
    card.AnchorPoint = Vector2.new(0.5,0.5)
    card.Position = UDim2.fromScale(0.5,0.5)
    card.Size = size or UDim2.new(0,620,0,360)
    card.BackgroundColor3 = CARD_BG
    corner(card,16); stroke(card,2,WHITE,0.85)

    -- soft shadow
    local shadow = Instance.new("ImageLabel", card)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://5028857084"
    shadow.ImageColor3 = Color3.fromRGB(0,0,0)
    shadow.ImageTransparency = 0.65
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(24,24,276,276)
    shadow.Size = UDim2.new(1,40,1,40)
    shadow.Position = UDim2.new(0,-20,0,-20)

    -- header
    local header = Instance.new("Frame", card)
    header.Size = UDim2.new(1,0,0,60)
    header.BackgroundColor3 = BASE_BG
    corner(header,14)
    gradient(header, Color3.fromRGB(18,21,24), BASE_BG, 90)
    stroke(header,1.2,WHITE,0.9)

    local title = Instance.new("TextLabel", header)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextColor3 = TEXT_MAIN
    title.RichText = true
    title.Text = ('KEY SYSTEM • <font color="#%02X%02X%02X">เข้าถึงสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)</font>')
        :format(ACCENT.R*255, ACCENT.G*255, ACCENT.B*255)
    title.Size = UDim2.new(1,-80,1,0)
    title.Position = UDim2.new(0,20,0,0)
    title.TextXAlignment = Enum.TextXAlignment.Left

    local close = Instance.new("TextButton", header)
    close.Size = UDim2.new(0,34,0,34)
    close.Position = UDim2.new(1,-44,0.5,-17)
    close.Text = "✕"
    close.Font = Enum.Font.GothamBold
    close.TextSize = 18
    close.TextColor3 = TEXT_MAIN
    close.BackgroundColor3 = FIELD_BG
    corner(close,10); stroke(close,1,WHITE,0.8)

    -- body
    local body = Instance.new("Frame", card)
    body.Size = UDim2.new(1,-24,1,-(60+24))
    body.Position = UDim2.new(0,12,0,72)
    body.BackgroundTransparency = 1

    return gui, root, card, header, body, close
end

local function drag(handle, target)
    local dragging, start, base
    handle.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dragging=true; start=i.Position; base=target.Position
            i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-start
            TweenService:Create(target, TweenInfo.new(0.08,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Position=UDim2.new(base.X.Scale,base.X.Offset+d.X,base.Y.Scale,base.Y.Offset+d.Y)}):Play()
        end
    end)
end

-- ====== PROMPT (UI) ======
function M.prompt(opts)
    opts = opts or {}
    local duration = opts.durationSec or durationDefault
    local validate = opts.validate  -- ฟังก์ชันภายนอก (ถ้ามี)
    local getKeyLink = opts.getKeyLink or "https://example.com"
    local discord    = opts.discordInvite or "https://discord.gg/"

    -- Card
    local gui, root, card, header, body, close = makeCard(UDim2.new(0,620,0,360))
    drag(header, card)

    -- key field row
    local field = Instance.new("Frame", body)
    field.Size = UDim2.new(1,0,0,44)
    field.BackgroundColor3 = BASE_BG
    corner(field,10); stroke(field,1,WHITE,0.92)

    local box = Instance.new("TextBox", field)
    box.BackgroundColor3 = FIELD_BG
    box.Size = UDim2.new(1,-(96+16),1,-8)
    box.Position = UDim2.new(0,8,0,4)
    box.PlaceholderText = "Insert your key here"
    box.Text = ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 16
    box.TextColor3 = TEXT_MAIN
    box.PlaceholderColor3 = TEXT_SOFT
    box.ClearTextOnFocus = false
    corner(box,8)

    local paste = Instance.new("TextButton", field)
    paste.Size = UDim2.new(0,88,1,-8)
    paste.Position = UDim2.new(1,-(88+8),0,4)
    paste.Text = "Paste"
    paste.Font = Enum.Font.GothamSemibold
    paste.TextSize = 16
    paste.TextColor3 = TEXT_MAIN
    paste.BackgroundColor3 = FIELD_BG
    corner(paste,8); stroke(paste,1,WHITE,0.85)

    paste.MouseButton1Click:Connect(function()
        local v = ""
        pcall(function() v = getclipboard and getclipboard() or "" end)
        if v and #v>0 then box.Text = v end
    end)

    -- submit button
    local submit = Instance.new("TextButton", body)
    submit.Size = UDim2.new(1,0,0,46)
    submit.Position = UDim2.new(0,0,0,64)
    submit.Text = "Submit Key  ▸"
    submit.Font = Enum.Font.GothamBlack
    submit.TextSize = 18
    submit.TextColor3 = Color3.fromRGB(8,16,10)
    submit.BackgroundColor3 = ACCENT
    corner(submit,10)
    stroke(submit,1,WHITE,0.75)
    gradient(submit, Color3.fromRGB(180,255,215), ACCENT, 90) -- เงาสวยๆ

    local line = Instance.new("Frame", body)
    line.Size = UDim2.new(1,0,0,1)
    line.Position = UDim2.new(0,0,0,120)
    line.BackgroundColor3 = WHITE
    line.BackgroundTransparency = 0.9

    -- bottom buttons: Get Key (ซ้าย) | Discord (ขวา)
    local getKey = Instance.new("TextButton", body)
    getKey.Size = UDim2.new(0.45,0,0,44)
    getKey.Position = UDim2.new(0,0,1,-48)
    getKey.Text = "🔓  Get Key"
    getKey.Font = Enum.Font.GothamSemibold
    getKey.TextSize = 16
    getKey.TextColor3 = TEXT_MAIN
    getKey.BackgroundColor3 = FIELD_BG
    corner(getKey,12); stroke(getKey,1,WHITE,0.85)
    getKey.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(getKeyLink) end
        submit.Text = "คัดลอกลิงก์ Get Key แล้ว"
        task.delay(0.9, function() submit.Text = "Submit Key  ▸" end)
    end)

    local disc = Instance.new("TextButton", body)
    disc.Size = UDim2.new(0.45,0,0,44)
    disc.Position = UDim2.new(1,-(math.floor(0.45*body.AbsoluteSize.X)),1,-48) -- จะถูกแก้เมื่อ AbsoluteSize พร้อม
    disc.AnchorPoint = Vector2.new(1,0)
    disc.Text = "💬  Discord"
    disc.Font = Enum.Font.GothamSemibold
    disc.TextSize = 16
    disc.TextColor3 = TEXT_MAIN
    disc.BackgroundColor3 = FIELD_BG
    corner(disc,12); stroke(disc,1,WHITE,0.85)
    disc.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(discord) end
        submit.Text = "คัดลอก Discord แล้ว"
        task.delay(0.9, function() submit.Text = "Submit Key  ▸" end)
    end)

    -- helper text (กลางล่าง)
    local help = Instance.new("TextLabel", body)
    help.BackgroundTransparency = 1
    help.Font = Enum.Font.Gotham
    help.TextSize = 14
    help.TextColor3 = TEXT_SOFT
    help.Text = "ต้องการความช่วยเหลือ? Join the Discord"
    help.Size = UDim2.new(1,0,0,18)
    help.Position = UDim2.new(0,0,1,-74)
    help.TextXAlignment = Enum.TextXAlignment.Center

    -- open anim
    card.BackgroundTransparency = 1
    card.Position = UDim2.new(0.5,0,0.5,12)
    TweenService:Create(card, TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {BackgroundTransparency=0, Position=UDim2.fromScale(0.5,0.5)}):Play()

    -- close handler
    local function closeUI()
        TweenService:Create(card, TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.In),
            {BackgroundTransparency=1, Position=UDim2.new(0.5,0,0.5,12)}):Play()
        task.delay(0.16, function() gui:Destroy() end)
    end
    close.MouseButton1Click:Connect(closeUI)

    -- submit handler (รองรับ validate ภายนอก / ลิสต์ภายใน)
    submit.MouseButton1Click:Connect(function()
        local k = (box.Text or ""):gsub("^%s+",""):gsub("%s+$","")
        local ok = false
        if type(validate)=="function" then
            local s, v = pcall(validate, k)
            ok = s and v
        else
            ok = inList(k)
        end
        if ok then
            save({ key = k, ts = os.time(), duration = duration })
            submit.Text = "✔ ผ่านแล้ว"
            submit.BackgroundColor3 = Color3.fromRGB(65,255,170)
            task.delay(0.25, closeUI)
            if typeof(opts.onAccepted)=="function" then
                task.delay(0.3, function() pcall(opts.onAccepted) end)
            end
        else
            submit.Text = "❌ คีย์ไม่ถูกต้อง"
            submit.BackgroundColor3 = Color3.fromRGB(255,86,86)
            task.delay(0.9, function()
                submit.Text = "Submit Key  ▸"
                submit.BackgroundColor3 = ACCENT
            end)
        end
    end)

    -- ปรับตำแหน่งปุ่มขวา หลังจากรู้ AbsoluteSize
    task.defer(function()
        local w = body.AbsoluteSize.X
        disc.Position = UDim2.new(1,-math.floor(0.45*w),1,-48)
    end)
end

return M
