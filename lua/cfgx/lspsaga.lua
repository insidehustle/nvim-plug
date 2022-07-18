local saga = require 'lspsaga'

local action = require("lspsaga.codeaction")

-- code action
vim.keymap.set("n", "<leader>ra", action.code_action, { silent = true,noremap = true })
vim.keymap.set("v", "<leader>ra", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, { silent = true,noremap =true })

-- use default config
saga.init_lsp_saga()
