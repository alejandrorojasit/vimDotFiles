local keymap = vim.keymap
vim.g.mapleader = ',' -- Leader key map

-- New tab
keymap.set('n', '<leader>tb', ':tabedit<cr>')
keymap.set('n','<leader>tn', ':tabnext<cr>')
keymap.set('n','<leader>tp', ':tabprevious<cr>')
-- Split window
keymap.set('n', 'sp', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', 'vm',':new<cr>')
keymap.set('n', 'vn',':vnew<cr>')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Esc mapping
keymap.set('i', 'jk','<esc>')

-- Quit map
keymap.set('n', '<leader>q',':q<cr>')
keymap.set('n', '<leader>wa',':wa<cr>')


-- Show highlight under the cursor
keymap.set('n', '<leader>hi', function()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end,
  { silent = false }
)

-- Move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines and left the cursor at the begin
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll with the cursor at the middle 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move between highlights with cursor at the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remove highlights
vim.keymap.set("n", "<esc>", ":noh <CR>")

-- Quick fix moves
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
