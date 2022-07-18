--
---- Keymappings
--Remap space as leader key
local opts = {noremap = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", {silent=true, noremap=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert a newline without entering in insert mode, vim
keymap("n", "OO", "O<Esc>j", {silent=true})

--CTRL + S to save because maybe linux?
-- nmap <C-s> :w<CR>
-- vmap <C-s> <Esc><c-s>gv
-- imap <C-s> <Esc><c-s>

-- source init.vim
-- TODO turn this keymap into a plugin that loads 1 of 3 commands depending on the root type:
-- if package.json run npm install
-- if yarn.lock run npm install
-- if go.mod run go mod tidy
-- if Cargo.toml run cargo build
-- if init.vim run source init.vim
-- ADD: if the build or install fails set a global mark in it
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.vim<CR>", opts)

-- <leader><leader> toggles between buffers/ quick fileswitch
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Copy to clipboard
keymap('v', '<leader>y','"+y', opts)
keymap('n',  '<leader>Y',  '"+yg_',opts)
keymap('n',  '<leader>y', '"+y',opts)

-- " Paste from clipboard
keymap('n', '<leader>p', '"+p', opts)
keymap('n', '<leader>P', '"+P', opts)
keymap('v', '<leader>p', '"+p', opts)
keymap('v', '<leader>P', '"+P', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


keymap("n", "<C-n>", ":Explore<CR>", opts)

-- should be J, K respectively but whatefs
keymap("v", "<A-UP>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-DOWN>", ":m '<-2<CR>gv=gv", opts)

-- this is smart:
keymap("i", "<C-c>", "<ESC>", opts)

-- saving 
keymap("n", '<C-e>', ":Explore<CR>", opts)

-- explorer
keymap('n', '<C-s>', ':w<CR>', {silent=true})
keymap('i', '<C-s>', '<Esc><C-s>a', {silent=true})

-- moving selected text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- moving text to the left 
--keymap("v", "<Shift->>", ":m '<-2<CR>gv=gv", opts)
--keymap("v", "<Shift-<>", ":m '<-2<CR>gv=gv", opts)
