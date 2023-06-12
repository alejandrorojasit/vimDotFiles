local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require 'telescope'.extensions.file_browser.actions
local keymap =  vim.keymap.set

telescope.setup {
  defaults = {
    prompt_prefix = '🔭  ',
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  borderchars = {
    prompt = { "?", " ", " ", " ", "?", "?", " ", " " },
    results = { " " },
    preview = { " " },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ['i'] = {
        },
        ['n'] = {
        },
      },
    },
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('conventional_commits')
telescope.load_extension('dap')
telescope.load_extension('ultisnips')
telescope.load_extension('packer')
telescope.load_extension('neoclip')

keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>gf', builtin.git_files,{})
keymap('n', '<leader>gc', builtin.git_commits,{})
keymap('n', '<leader>gb', builtin.git_branches,{})
keymap('n', '<leader>gs', builtin.git_status,{})
keymap('n', '<leader>gt', builtin.git_stash,{})
keymap('n', '<leader>sf', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    --        cwd = telescope.buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end)
keymap('n', '<leader>dcmd', function()  telescope.extensions.dap.commands{} end)
keymap('n', '<leader>dcfg', function()  telescope.extensions.dap.configurations{} end)
keymap('n', '<leader>dlbp', function()  telescope.extensions.dap.list_breakpoints{} end)
keymap('n', '<leader>dvar', function()  telescope.extensions.dap.variables{} end)
keymap('n', '<leader>dframe', function()  telescope.extensions.dap.frames{} end)
keymap('n', '<leader>ls', function()  telescope.extensions.ultisnips.ultisnips{} end)
keymap('n', '<leader>cl', function()  telescope.extensions.neoclip.neoclip{} end)


keymap('n', '<leader>lr', builtin.lsp_references,{})
keymap('n', '<leader>ld', builtin.diagnostics,{})


vim.keymap.set('n', '<leader>cc', function()
  telescope.extensions.conventional_commits.conventional_commits()
end)
