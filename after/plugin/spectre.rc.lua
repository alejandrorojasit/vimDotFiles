local status, spectre = pcall(require,"spectre")

local NS = { noremap = true, silent = true }

spectre.setup()

vim.keymap.set('n','<leader>sp',function() spectre.open() end,NS)
