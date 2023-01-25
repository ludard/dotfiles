-- https://github.com/windwp/nvim-autopairs
-- require("nvim-autopairs").setup()

local setup, autopairs = pcall(require, "nvim-autopairs")
if not setup then
  print("nvim-autopairs is not installed.")
  return
end

autopairs.setup()
