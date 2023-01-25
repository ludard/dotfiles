-- colorscheme list:
-- nightfly
-- tokyonight
-- tokyonight-storm
-- OceanicNext
-- zephyr
-- nightfox
-- onedark
-- gruvbox
-- nord
-- onedark

local colorscheme = "nightfox"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
  -- vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  print("colorscheme '" .. colorscheme .. "' is not installed.")
  return
end
