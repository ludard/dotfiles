-- bufferline 将buffer转换为tab页
-- https://github.com/akinsho/bufferline.nvim
local setup, bufferline = pcall(require, "bufferline")
if not setup then
  print("bufferline is not installed.")
  return
end

bufferline.setup()
