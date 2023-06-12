require'hop'.setup{

}

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('n', 'sb', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('n', 'sa', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
