-- UFO HUB X - KEY MODULE (README3.lua)
-- API: check(opts)->bool, isValid()->bool, prompt(opts)
local ENV = (getgenv and getgenv()) or _G
ENV.__UFOX_KEY = ENV.__UFOX_KEY or { ok=false, exp=0 }

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

local function contains(t, x) for i=1,#t do if t[i]==x then return true end end return false end
local function now() return os.time() end

local function isValid()
  return ENV.__UFOX_KEY.ok and (ENV.__UFOX_KEY.exp or 0) > now()
end

local function check(opts)
  local dur = (opts and opts.durationSec) or (24*60*60)
  if isValid() then return true end
  -- ถ้ามีคีย์ติด clipboard ให้ auto-validate
  local key = (getclipboard and pcall(getclipboard) and getclipboard()) or nil
  if type(key)=="string" and contains(KEY_LIST, key) then
    ENV.__UFOX_KEY.ok  = true
    ENV.__UFOX_KEY.exp = now() + dur
    return true
  end
  return false
end

local function prompt(opts)
  local dur = (opts and opts.durationSec) or (24*60*60)
  local getKeyURL = (opts and opts.getKeyLink) or "https://linkunlocker.com/ufo-hub-x-wKfUt"
  local discordURL = (opts and opts.discordInvite) or "https://discord.gg/JFHuVVVQ6D"

  local g = Instance.new("ScreenGui")
  g.Name="UFOX_KEY_UI"; g.ResetOnSpawn=false; g.IgnoreGuiInset=true; g.DisplayOrder=10000
  g.Parent = game:GetService("Players").LocalPlayer.PlayerGui

  local f = Instance.new("Frame", g)
  f.Size = UDim2.new(0, 620, 0, 340)
  f.Position = UDim2.fromScale(0.5,0.5); f.AnchorPoint = Vector2.new(0.5,0.5)
  f.BackgroundColor3 = Color3.fromRGB(18,21,24)
  local c = Instance.new("UICorner", f); c.CornerRadius = UDim.new(0,14)
  local s = Instance.new("UIStroke", f); s.Thickness=2; s.Color=Color3.fromRGB(255,255,255); s.Transparency=0.75

  local title = Instance.new("TextLabel", f)
  title.BackgroundTransparency = 1; title.Position = UDim2.new(0,20,0,16); title.Size = UDim2.new(1,-40,0,28)
  title.Font=Enum.Font.GothamBlack; title.TextSize=22
  title.RichText=true
  title.Text = '<font color="#16F77B">KEY SYSTEM</font> • เข้าถึงสคริปต์ต้องมีคีย์ (อายุ 24 ชม.)'
  title.TextColor3 = Color3.fromRGB(230,238,245)

  local tb = Instance.new("TextBox", f)
  tb.Size = UDim2.new(1,-200,0,42); tb.Position = UDim2.new(0,20,0,80)
  tb.BackgroundColor3 = Color3.fromRGB(25,29,33); tb.PlaceholderText = "Insert your key here"
  tb.TextColor3 = Color3.fromRGB(230,238,245); tb.PlaceholderColor3 = Color3.fromRGB(150,158,166)
  local ct = Instance.new("UICorner", tb); ct.CornerRadius = UDim.new(0,10)
  local st = Instance.new("UIStroke", tb); st.Thickness=1; st.Color=Color3.fromRGB(255,255,255); st.Transparency=0.8

  local paste = Instance.new("TextButton", f)
  paste.Size = UDim2.new(0,150,0,42); paste.Position = UDim2.new(1,-170,0,80)
  paste.BackgroundColor3 = Color3.fromRGB(25,29,33); paste.Text="Paste"; paste.TextSize=16; paste.Font=Enum.Font.GothamSemibold
  local cp = Instance.new("UICorner", paste); cp.CornerRadius = UDim.new(0,10)
  local sp = Instance.new("UIStroke", paste); sp.Thickness=1; sp.Color=Color3.fromRGB(255,255,255); sp.Transparency=0.8
  paste.MouseButton1Click:Connect(function()
    if setclipboard and tb.Text~="" then setclipboard(tb.Text) end
    if getclipboard then local ok,txt=pcall(getclipboard); if ok then tb.Text=txt end end
  end)

  local submit = Instance.new("TextButton", f)
  submit.Size = UDim2.new(1,-40,0,46); submit.Position = UDim2.new(0,20,0,140)
  submit.BackgroundColor3 = Color3.fromRGB(22,247,123); submit.Text="Submit Key  ▸"
  submit.TextColor3=Color3.fromRGB(0,30,20); submit.TextSize=18; submit.Font=Enum.Font.GothamBold
  local cs = Instance.new("UICorner", submit); cs.CornerRadius=UDim.new(0,12)

  local info = Instance.new("TextLabel", f)
  info.BackgroundTransparency=1; info.Position=UDim2.new(0,20,1,-30); info.Size=UDim2.new(1,-40,0,20)
  info.Text="ต้องการความช่วยเหลือ? Join the Discord"; info.TextColor3=Color3.fromRGB(170,180,190)
  info.TextSize=14; info.Font=Enum.Font.Gotham

  local function accept()
    if contains(KEY_LIST, tb.Text) then
      ENV.__UFOX_KEY.ok=true; ENV.__UFOX_KEY.exp=os.time()+dur
      g:Destroy()
      return true
    else
      submit.Text="ผิดพลาด! ลองใหม่"; task.delay(1.2,function() submit.Text="Submit Key  ▸" end)
      return false
    end
  end

  submit.MouseButton1Click:Connect(accept)
end

return { check=check, isValid=isValid, prompt=prompt }
