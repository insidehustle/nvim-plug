local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
-- This is your opts table
telescope.setup {
  extensions = {
      ["project"] = {},
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")
--require("telescope").load_extension("project")
--Remap space as leader key
local opts = {noremap = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", {silent=true, noremap=true})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
-- Find in text
keymap("n", "<leader>s", "<cmd>Telescope live_grep<CR>",opts)
-- Find open buffers
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>",opts)
-- Find mark
keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>",opts)
-- Find in man pages
keymap("n", "<leader>f0", "<cmd>Telescope man_pages<CR>",opts)
-- Find and add items to quickfix list
keymap("n", "<leader>fq", "<cmd>Telescope quickfix<CR>",opts)
-- Find and enter git branches
keymap("n", "<leader>fg", "<cmd>Telescope git_branches<CR>",opts)
-- find apis that can be used
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",opts)
-- find keymaps that can be used
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>",opts)
-- file file_browser
keymap("n", "<leader>fp", ":Telescope file_browser<CR>", opts)
-- Telescope project
keymap("n", "<leader>fpr", ":lua require'telescope'.extensions.project.project{}<CR>",opts)
