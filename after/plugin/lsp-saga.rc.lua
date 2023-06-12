local saga = require('lspsaga')
local keymap = vim.keymap.set

saga.setup({
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })

-- Code action
keymap({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })


-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', { silent = true })

-- Go to definition
keymap("n","<leader>gd", "<cmd>Lspsaga goto_definition<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
keymap('n', '<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })
keymap('n', '<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })

-- Only jump to error
keymap('n', '<leader>pe', function()
    require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap('n', '<leader>ne', function()
    require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap('n','<leader>o', '<cmd>Lspsaga outline<CR>',{ silent = true })

-- Hover Doc
keymap('n', '<leader>doc', '<cmd>Lspsaga hover_doc<CR>', { silent = true })

-- Float terminal
--keymap('n', '<leader>te', '<cmd>Lspsaga open_floaterm<CR>', { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap({"n","t"}, '<leader>te', '<cmd>Lspsaga term_toggle lazygit<CR>')
