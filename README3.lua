local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

local FS = (isfile and writefile and readfile and makefolder) and true or false
local FILE = "UFO_HUB_X/key.json"

-- ====== ใส่คีย์ที่ถูกต้องทั้งหมด ======
local VALID = {
    "UFOHUBXDMF9YK0XZM24h","UFOHUBX70OJIR4IF124h", -- ... (วางทั้งหมดของคุณ)
}

local function inList(k)
    for _,v in ipairs(VALID) do if v==k then return true end end
    return false
end

local function now() return os.time() end
local function save(dat)
    if FS then
        pcall(function() makefolder("UFO_HUB_X"); writefile(FILE, HttpService:JSONEncode(dat)) end)
    else
        getgenv().__UFOX_KEYCACHE = dat
    end
end
local function load()
    if FS and isfile(FILE) then
        local ok, s = pcall(readfile, FILE); if ok then return HttpService:JSONDecode(s) end
    end
    return getgenv().__UFOX_KEYCACHE
end
local function valid()
    local d = load(); if not d or not d.key or not d.ts then return false end
    return (now()-d.ts) < (24*60*60)
end

local M = {}

function M.check(cfg)
    if valid() then return true end
    return false, "no valid key"
end

function M.isValid() return valid() end

function M.prompt(opt)
    local gui = Instance.new("ScreenGui", pgui)
    gui.Name = "UFOX_KEY"
    gui.DisplayOrder = 2100
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    local bg = Instance.new("Frame", gui)
    bg.AnchorPoint = Vector2.new(0.5,0.5)
    bg.Position = UDim2.fromScale(0.5,0.5)
    bg.Size = UDim2.new(0,560,0,330)
    bg.BackgroundColor3 = Color3.fromRGB(14,17,19)
    local c = Instance.new("UICorner", bg); c.CornerRadius = UDim.new(0,16)

    local title = Instance.new("TextLabel", bg)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 19
    title.TextColor3 = Color3.fromRGB(221,228,234)
    title.RichText = true
    title.Text = 'KEY SYSTEM • <font color="#DDE4EA">เข้าถึงสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)</font>'
    title.Size = UDim2.new(1,-24,0,40)
    title.Position = UDim2.new(0,12,0,10)

    local box = Instance.new("TextBox", bg)
    box.Size = UDim2.new(1,-140,0,40)
    box.Position = UDim2.new(0,20,0,80)
    box.PlaceholderText = "Insert your key here"
    box.Font = Enum.Font.Gotham
    box.TextSize = 16
    box.TextColor3 = Color3.fromRGB(221,228,234)
    box.PlaceholderColor3 = Color3.fromRGB(130,138,146)
    box.BackgroundColor3 = Color3.fromRGB(27,32,36)
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

    local paste = Instance.new("TextButton", bg)
    paste.Size = UDim2.new(0,90,0,40)
    paste.Position = UDim2.new(1,-110,0,80)
    paste.Text = "Paste"
    paste.Font = Enum.Font.GothamSemibold
    paste.TextSize = 16
    paste.TextColor3 = Color3.fromRGB(221,228,234)
    paste.BackgroundColor3 = Color3.fromRGB(20,24,27)
    Instance.new("UICorner", paste).CornerRadius = UDim.new(0,10)
    paste.MouseButton1Click:Connect(function()
        if getclipboard then local t=pcall(getclipboard); local v = getclipboard and getclipboard() or "" ; if v and #v>0 then box.Text=v end end
    end)

    local submit = Instance.new("TextButton", bg)
    submit.Size = UDim2.new(1,-40,0,42)
    submit.Position = UDim2.new(0,20,0,132)
    submit.Text = "Submit Key ▸"
    submit.Font = Enum.Font.GothamBlack
    submit.TextSize = 18
    submit.TextColor3 = Color3.fromRGB(10,18,12)
    submit.BackgroundColor3 = Color3.fromRGB(22,247,123)
    Instance.new("UICorner", submit).CornerRadius = UDim.new(0,10)

    local getk = Instance.new("TextButton", bg)
    getk.Size = UDim2.new(0.45,0,0,44)
    getk.Position = UDim2.new(0,20,1,-54)
    getk.Text = "🔓  Get Key"
    getk.BackgroundColor3 = Color3.fromRGB(20,24,27)
    getk.Font = Enum.Font.GothamSemibold; getk.TextSize=16; getk.TextColor3=Color3.fromRGB(221,228,234)
    Instance.new("UICorner", getk).CornerRadius = UDim.new(0,12)
    getk.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(opt.getKeyLink or "") end
    end)

    local disc = Instance.new("TextButton", bg)
    disc.Size = UDim2.new(0.45,0,0,44)
    disc.Position = UDim2.new(1,-(20+math.floor(0.45*bg.AbsoluteSize.X)),1,-54)
    disc.AnchorPoint = Vector2.new(1,0)
    disc.Text = "💬  Discord"
    disc.BackgroundColor3 = Color3.fromRGB(20,24,27)
    disc.Font = Enum.Font.GothamSemibold; disc.TextSize=16; disc.TextColor3=Color3.fromRGB(221,228,234)
    Instance.new("UICorner", disc).CornerRadius = UDim.new(0,12)
    disc.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(opt.discordInvite or "") end
    end)

    submit.MouseButton1Click:Connect(function()
        local k = box.Text or ""
        if inList(k) then
            save({key=k, ts=os.time()})
            gui:Destroy()
            if opt.onAccepted then pcall(opt.onAccepted) end
        else
            submit.Text = "❌ Invalid"
            task.delay(0.8, function() submit.Text="Submit Key ▸" end)
        end
    end)
end

return M
