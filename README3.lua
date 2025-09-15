--========================================================
-- UFO HUB X — KEY MODULE (README3.lua)  [100 KEYS BUILT-IN]
-- UI สไตล์นีออนเขียว พร้อมตรวจคีย์อายุ 24 ชม.
-- API: isValid(), check(opts), prompt(opts)
--========================================================
local ENV = (getgenv and getgenv()) or _G
ENV.__UFOX_KEY = ENV.__UFOX_KEY or { ok=false, exp=0 }

-- ✅ Key 100 ตัว (ตามที่ให้มา)
local KEY_LIST = {
  "UFOHUBXDMF9YK0XZM24h","UFOHUBX70OJIR4IF124h","UFOHUBX59XO3283ZB24h",
  "UFOHUBX0G86MNVDJX24h","UFOHUBX4Z80TW9L5H24h","UFOHUBX7RXW8H0JX224h",
  "UFOHUBX66CXRW8Q6P24h","UFOHUBX8G8K2S2QO624h","UFOHUBXWZQJX4BC1V24h",
  "UFOHUBX9W6A1GZ0MZ24h","UFOHUBXK8B3O3NGOB24h","UFOHUBX8N3O2R3V8K24h",
  "UFOHUBX8N9VQ8Z6Q324h","UFOHUBX3UCFY0X5VH24h","UFOHUBX4XHZC7Y2J124h",
  "UFOHUBX6H5H2M8H1B24h","UFOHUBX6N2MBXJ0ZP24h","UFOHUBXQ3D4XK3W7C24h",
  "UFOHUBX9Y0Z6R3V1W24h","UFOHUBX0G2L0Q8P0A24h","UFOHUBX2T2M4X0P1P24h",
  "UFOHUBX2QFQ5H2QK724h","UFOHUBX7H4M9H3M6I24h","UFOHUBX0C3W2J8O2U24h",
  "UFOHUBX1Z0V2J8L5W24h","UFOHUBX7G8G7S8D7Z24h","UFOHUBX9A5K6B4W0P24h",
  "UFOHUBX2C6C7S4T6J24h","UFOHUBXT9E4L7W1Z824h","UFOHUBX2X9V4I8Y4N24h",
  "UFOHUBX2F2Z2M5S5D24h","UFOHUBX1D3H7N9T2K24h","UFOHUBX8W4B8M2A1P24h",
  "UFOHUBX3V8Q5M7K2C24h","UFOHUBX7Q2I5G3W0Z24h","UFOHUBX4N0E0N4L0P24h",
  "UFOHUBX0G8N7L7C3V24h","UFOHUBX5Q1J7M6Z4A24h","UFOHUBXC5I0H9U3S824h",
  "UFOHUBX0J4Q1E4T4E24h","UFOHUBX5C1E1J0B3O24h","UFOHUBX7T6M5N4V1S24h",
  "UFOHUBX4I9A0V0E4Z24h","UFOHUBX1Z8N4R2Q0K24h","UFOHUBX3Y5K1H2Q3J24h",
  "UFOHUBX5J7C2G1P8M24h","UFOHUBX1R0I7Z8S0V24h","UFOHUBX6G2K5N8L3D24h",
  "UFOHUBX2N1Z5M4C7B24h","UFOHUBX3W6Q4E9J1N24h","UFOHUBX4Q2M6H1C9X24h",
  "UFOHUBX7P4V2L9T0I24h","UFOHUBX8M0D1Q3W7E24h","UFOHUBX9L5S2A4K6Z24h",
  "UFOHUBX0K1P3O5I7U24h","UFOHUBX4U3I5Y7T9R24h","UFOHUBX2M4N6B8V0C24h",
  "UFOHUBX6B7V9C1X3Z24h","UFOHUBX8V1C3X5Z7B24h","UFOHUBX0C2X4Z6B8N24h",
  "UFOHUBX3Z5B7N9M1V24h","UFOHUBX5B8N0M2V4C24h","UFOHUBX7N2M4V6C8X24h",
  "UFOHUBX9M4V6C8X0Z24h","UFOHUBX1V3C5X7Z9B24h","UFOHUBX2C4X6Z8B0N24h",
  "UFOHUBX3X6Z8B0N2M24h","UFOHUBX4Z7B9N1M3V24h","UFOHUBX5N9M1V3C5X24h",
  "UFOHUBX6M1V3C5X7Z24h","UFOHUBX7V3C5X7Z9B24h","UFOHUBX8C5X7Z9B1N24h",
  "UFOHUBX9X7Z9B1N3M24h","UFOHUBX0Z9B1N3M5V24h","UFOHUBX1B1N3M5V7C24h",
  "UFOHUBX2N3M5V7C9X24h","UFOHUBX3M5V7C9X1Z24h","UFOHUBX4V7C9X1Z3B24h",
  "UFOHUBX5C9X1Z3B5N24h","UFOHUBX6X1Z3B5N7M24h","UFOHUBX7Z3B5N7M9V24h",
  "UFOHUBX8B5N7M9V1C24h","UFOHUBX9N7M9V1C3X24h","UFOHUBX0M9V1C3X5Z24h",
  "UFOHUBX1V1C3X5Z7B24h","UFOHUBX2C3X5Z7B9N24h","UFOHUBX3X5Z7B9N1M24h",
  "UFOHUBX4Z7B9N1M3V24h","UFOHUBX5B9N1M3V5C24h","UFOHUBX6N1M3V5C7X24h",
  "UFOHUBX7M3V5C7X9Z24h","UFOHUBX8V5C7X9Z1B24h","UFOHUBX9C7X9Z1B3N24h",
  "UFOHUBX0X9Z1B3N5M24h","UFOHUBX1Z1B3N5M7V24h","UFOHUBX2B3N5M7V9C24h",
  "UFOHUBX3N5M7V9C1X24h","UFOHUBX4M7V9C1X3Z24h","UFOHUBX5V9C1X3Z5B24h",
  "UFOHUBX6C1X3Z5B7N24h","UFOHUBX7X3Z5B7N9M24h","UFOHUBX8Z5B7N9M1V24h",
  "UFOHUBX9B7N9M1V3C24h","UFOHUBX0N9M1V3C5X24h","UFOHUBX1M1V3C5X7Z24h",
  "UFOHUBX2V3C5X7Z9B24h","UFOHUBX3C5X7Z9B1N24h","UFOHUBX4X7Z9B1N3M24h",
  "UFOHUBX5Z9B1N3M5V24h","UFOHUBX6B1N3M5V7C24h","UFOHUBX7N3M5V7C9X24h",
  "UFOHUBX8M5V7C9X1Z24h","UFOHUBX9V7C9X1Z3B24h","UFOHUBX1H049FTRA024h",
  "UFOHUBX7GB158W98N24h","UFOHUBXLQ7T871OFY24h","UFOHUBXZPPK52HC8G24h",
  "UFOHUBXBO6IC0I7MM24h",
}

-- =========== Utils & Validation ===========
local function now() return os.time() end
local function contains(t, x) for i=1,#t do if t[i]==x then return true end end return false end
local function isValid() return ENV.__UFOX_KEY.ok and (ENV.__UFOX_KEY.exp or 0) > now() end

local function check(opts)
  local dur = (opts and opts.durationSec) or (24*60*60)
  if isValid() then return true end
  local ok, clip = pcall(function() return getclipboard and getclipboard() end)
  if ok and type(clip)=="string" and contains(KEY_LIST, clip) then
    ENV.__UFOX_KEY.ok  = true
    ENV.__UFOX_KEY.exp = now() + dur
    return true
  end
  return false
end

-- =========== UI (เหมือนเวอร์ชันสวยที่ทำไว้) ===========
local function prompt(opts)
  local dur         = (opts and opts.durationSec) or (24*60*60)
  local getKeyURL   = (opts and opts.getKeyLink)  or "https://linkunlocker.com/ufo-hub-x-wKfUt"
  local discordURL  = (opts and opts.discordInvite) or "https://discord.gg/JFHuVVVQ6D"

  local PLR = game:GetService("Players").LocalPlayer
  local PG  = PLR:WaitForChild("PlayerGui")

  local gui = Instance.new("ScreenGui")
  gui.Name="UFOX_KEY_UI"; gui.IgnoreGuiInset=true; gui.ResetOnSpawn=false; gui.DisplayOrder=10000
  gui.Parent = PG

  local dim = Instance.new("Frame", gui)
  dim.BackgroundColor3 = Color3.fromRGB(0,0,0); dim.BackgroundTransparency=0.35
  dim.Size = UDim2.fromScale(1,1)

  local card = Instance.new("Frame", gui)
  card.AnchorPoint=Vector2.new(0.5,0.5); card.Position=UDim2.fromScale(0.5,0.5)
  card.Size=UDim2.fromOffset(760,460); card.BackgroundColor3=Color3.fromRGB(16,18,20)
  local c = Instance.new("UICorner",card); c.CornerRadius=UDim.new(0,18)
  local stroke=Instance.new("UIStroke",card); stroke.Thickness=2; stroke.Color=Color3.fromRGB(255,255,255); stroke.Transparency=0.8

  local header = Instance.new("Frame",card); header.BackgroundTransparency=1
  header.Position=UDim2.new(0,14,0,10); header.Size=UDim2.new(1,-28,0,52)

  local titleSmall=Instance.new("TextLabel",header)
  titleSmall.BackgroundTransparency=1; titleSmall.Font=Enum.Font.GothamBold; titleSmall.TextSize=18
  titleSmall.TextXAlignment=Enum.TextXAlignment.Left; titleSmall.Size=UDim2.new(1,-48,1,0)
  titleSmall.TextColor3=Color3.fromRGB(200,210,218); titleSmall.RichText=true
  titleSmall.Text='<font color="#16F77B">KEY SYSTEM</font>  •  เข้าถึงสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)'

  local close=Instance.new("TextButton",header)
  close.Size=UDim2.fromOffset(36,36); close.Position=UDim2.new(1,-36,0,8)
  close.Text="✕"; close.Font=Enum.Font.GothamBold; close.TextSize=20
  close.BackgroundColor3=Color3.fromRGB(28,30,34); close.TextColor3=Color3.fromRGB(235,242,248)
  local cx=Instance.new("UICorner",close); cx.CornerRadius=UDim.new(0,10)
  local sx=Instance.new("UIStroke",close); sx.Thickness=1; sx.Color=Color3.fromRGB(255,255,255); sx.Transparency=0.85
  close.MouseButton1Click:Connect(function() gui:Destroy() end)

  local big=Instance.new("TextLabel",card)
  big.BackgroundTransparency=1; big.Position=UDim2.new(0,40,0,74); big.Size=UDim2.new(1,-80,0,52)
  big.Font=Enum.Font.GothamBlack; big.TextSize=32; big.RichText=true; big.TextXAlignment=Enum.TextXAlignment.Left
  big.Text='Welcome to The,\n<font color="#16F77B">UFO</font> HUB X'
  big.TextColor3=Color3.fromRGB(235,242,248)

  local keyLbl=Instance.new("TextLabel",card)
  keyLbl.BackgroundTransparency=1; keyLbl.Position=UDim2.new(0,40,0,148); keyLbl.Size=UDim2.new(0,60,0,22)
  keyLbl.Font=Enum.Font.GothamSemibold; keyLbl.TextSize=16; keyLbl.TextColor3=Color3.fromRGB(185,195,205); keyLbl.Text="Key"

  local field=Instance.new("TextBox",card)
  field.Position=UDim2.new(0,40,0,176); field.Size=UDim2.new(1,-200,0,46)
  field.BackgroundColor3=Color3.fromRGB(25,29,33); field.PlaceholderText="insert your key here"
  field.TextColor3=Color3.fromRGB(230,238,245); field.PlaceholderColor3=Color3.fromRGB(145,155,165)
  field.TextSize=16; field.Font=Enum.Font.Gotham
  local cf=Instance.new("UICorner",field); cf.CornerRadius=UDim.new(0,12)
  local sf=Instance.new("UIStroke",field); sf.Thickness=1; sf.Color=Color3.fromRGB(255,255,255); sf.Transparency=0.85

  local paste=Instance.new("TextButton",card)
  paste.Position=UDim2.new(1,-140,0,176); paste.Size=UDim2.new(0,100,0,46)
  paste.BackgroundColor3=Color3.fromRGB(25,29,33); paste.TextColor3=Color3.fromRGB(230,238,245)
  paste.Text="Paste"; paste.TextSize=16; paste.Font=Enum.Font.GothamSemibold
  local cp=Instance.new("UICorner",paste); cp.CornerRadius=UDim.new(0,12)
  local sp=Instance.new("UIStroke",paste); sp.Thickness=1; sp.Color=Color3.fromRGB(255,255,255); sp.Transparency=0.85
  paste.MouseButton1Click:Connect(function()
    if getclipboard then local ok,txt=pcall(getclipboard); if ok and type(txt)=="string" then field.Text=txt end end
  end)

  local submit=Instance.new("TextButton",card)
  submit.Position=UDim2.new(0,40,0,236); submit.Size=UDim2.new(1,-80,0,52)
  submit.Text="Submit Key  ▸"; submit.TextSize=18; submit.Font=Enum.Font.GothamBold
  submit.TextColor3=Color3.fromRGB(0,30,20); submit.BackgroundColor3=Color3.fromRGB(22,247,123)
  local cs=Instance.new("UICorner",submit); cs.CornerRadius=UDim.new(0,14)

  local line=Instance.new("Frame",card)
  line.Position=UDim2.new(0,40,0,300); line.Size=UDim2.new(1,-80,0,1)
  line.BackgroundColor3=Color3.fromRGB(255,255,255); line.BackgroundTransparency=0.85

  local tip=Instance.new("TextLabel",card)
  tip.BackgroundTransparency=1; tip.Position=UDim2.new(0,40,0,312); tip.Size=UDim2.new(1,-80,0,18)
  tip.Font=Enum.Font.Gotham; tip.TextSize=14; tip.TextColor3=Color3.fromRGB(180,190,200)
  tip.Text="Need support? Join the Discord"

  local row=Instance.new("Frame",card); row.BackgroundTransparency=1
  row.Position=UDim2.new(0,40,1,-72); row.Size=UDim2.new(1,-80,0,52)
  local list=Instance.new("UIListLayout",row); list.FillDirection=Enum.FillDirection.Horizontal
  list.HorizontalAlignment=Enum.HorizontalAlignment.Center; list.Padding=UDim.new(0,28)

  local function pill(text)
    local b=Instance.new("TextButton"); b.Size=UDim2.fromOffset(220,48)
    b.BackgroundColor3=Color3.fromRGB(25,29,33); b.TextColor3=Color3.fromRGB(230,238,245)
    b.TextSize=16; b.Font=Enum.Font.GothamSemibold; b.Text=text
    local cb=Instance.new("UICorner",b); cb.CornerRadius=UDim.new(0,14)
    local sb=Instance.new("UIStroke",b); sb.Thickness=1; sb.Color=Color3.fromRGB(255,255,255); sb.Transparency=0.85
    b.Parent=row; return b
  end
  local getKeyBtn=pill("🔓  Get Key"); local discBtn=pill("💬  Discord")
  getKeyBtn.MouseButton1Click:Connect(function()
    local url= (opts and opts.getKeyLink) or "https://linkunlocker.com/ufo-hub-x-wKfUt"
    if setclipboard then setclipboard(url) end
    if syn and syn.open_url then syn.open_url(url) end
  end)
  discBtn.MouseButton1Click:Connect(function()
    local url= (opts and opts.discordInvite) or "https://discord.gg/JFHuVVVQ6D"
    if setclipboard then setclipboard(url) end
    if syn and syn.open_url then syn.open_url(url) end
  end)

  local foot=Instance.new("TextLabel",card)
  foot.BackgroundTransparency=1; foot.Position=UDim2.new(0,0,1,-24); foot.Size=UDim2.new(1,0,0,18)
  foot.Font=Enum.Font.Gotham; foot.TextSize=13; foot.TextColor3=Color3.fromRGB(165,175,185)
  foot.Text="Key จะหมดอายุทุก ๆ 24 ชั่วโมง (นับจริง)"

  local function accept()
    local k=field.Text
    if type(k)=="string" and contains(KEY_LIST, k) then
      ENV.__UFOX_KEY.ok=true; ENV.__UFOX_KEY.exp=now()+dur
      gui:Destroy(); return true
    else
      submit.Text="Invalid key!  ✕"; submit.BackgroundColor3=Color3.fromRGB(240,78,78)
      task.delay(1.2,function() submit.Text="Submit Key  ▸"; submit.BackgroundColor3=Color3.fromRGB(22,247,123) end)
      return false
    end
  end
  submit.MouseButton1Click:Connect(accept)
  field.FocusLost:Connect(function(enter) if enter then accept() end end)
end

return { isValid=isValid, check=check, prompt=prompt }
