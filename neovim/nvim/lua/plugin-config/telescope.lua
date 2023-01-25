-- https://github.com/nvim-telescope/telescope.nvim
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print("telescope is not installed.")
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print("telescope.actions is not installed.")
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    buffer_previewer_maker = nil,
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
      }
    },
    mappings = {
      i = {
        ["<C-p>"] = actions.move_selection_previous, -- move to prev result
        ["<C-n>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

telescope.load_extension("fzf")

-- require('telescope').load_extension('fzf')
