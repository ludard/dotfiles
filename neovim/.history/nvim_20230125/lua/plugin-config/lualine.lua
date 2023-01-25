-- https://github.com/nvim-lualine/lualine.nvim 
local setup, lualine = pcall(require, "lualine") 
if not setup then return
  vim.notify("lualine is not installed.")
end

local lualine_nightfly = require("lualine.themes.nightfly")

local user_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

lualine_nightfly.normal.a.bg = user_colors.blue
lualine_nightfly.insert.a.bg = user_colors.green
lualine_nightfly.visual.a.bg = user_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = user_colors.yellow,
    fg = user_colors.black,
  },
}

lualine.setup({
  options = {
    theme = lualine_nightfly
  }
})
