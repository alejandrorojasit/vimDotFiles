local neotest = require('neotest')
local neotest_ns = vim.api.nvim_create_namespace('neotest')
local coverage =  require('coverage')

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
      diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
      return message
    end,
  },
}, neotest_ns)

coverage.setup()

neotest.setup({
  adapters = {
    require('neotest-python')({
            args = {"--cov"}
        }),
    require('neotest-go')({
      experimental = {
        test_table = true,
      },
      args = {"-covermode=atomic" ,"-coverprofile=coverage.out"}
    }),
    require('neotest-jest')({
      jestCommand = 'npm test --',
      jestConfigFile = 'custom.jest.config.ts',
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
  benchmark = {
    enabled = true
  },
  consumers = {},
  default_strategy = 'integrated',
  diagnostic = {
    enabled = true
  },
  discovery = {
    concurrent = 0,
    enabled = true
  },
  floating = {
    border = 'rounded',
    max_height = 0.6,
    max_width = 0.6,
    options = {}
  },
  highlights = {
    adapter_name = 'NeotestAdapterName',
    border = 'NeotestBorder',
    dir = 'NeotestDir',
    expand_marker = 'NeotestExpandMarker',
    failed = 'NeotestFailed',
    file = 'NeotestFile',
    focused = 'NeotestFocused',
    indent = 'NeotestIndent',
    marked = 'NeotestMarked',
    namespace = 'NeotestNamespace',
    passed = 'NeotestPassed',
    running = 'NeotestRunning',
    select_win = 'NeotestWinSelect',
    skipped = 'NeotestSkipped',
    target = 'NeotestTarget',
    test = 'NeotestTest',
    unknown = 'NeotestUnknown'
  },
  icons = {
    child_indent = '│',
    child_prefix = '├',
    collapsed = '─',
    expanded = '╮',
    failed = '',
    final_child_indent = ' ',
    final_child_prefix = '╰',
    non_collapsible = '─',
    passed = '',
    running = '',
    running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
    skipped = '',
    unknown = ''
  },
  jump = {
    enabled = true
  },
  log_level = 3,
  output = {
    enabled = true,
    open_on_run = 'short'
  },
  projects = {},
  run = {
    enabled = true
  },
  running = {
    concurrent = true
  },
  status = {
    enabled = true,
    signs = true,
    virtual_text = false
  },
  strategies = {
    integrated = {
      height = 40,
      width = 120
    }
  },
  summary = {
    animated = true,
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = 'a',
      clear_marked = 'M',
      clear_target = 'T',
      expand = { '<CR>', '<2-LeftMouse>' },
      expand_all = 'e',
      jumpto = 'i',
      mark = 'm',
      next_failed = 'J',
      output = 'o',
      prev_failed = 'K',
      run = 'r',
      run_marked = 'R',
      short = 'O',
      stop = 'u',
      target = 't'
    }
  }
})

vim.keymap.set('n', '<leader>tc', function() neotest.run.run() neotest.summary.open() end,{silent = true})
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) neotest.summary.open() end,{silent = true})
vim.keymap.set('n', '<leader>td', function() neotest.run.run({strategy = 'dap'}) neotest.summary.open() end,{silent = true})
vim.keymap.set('n', '<leader>ta', function() neotest.run.run(vim.fn.getcwd()) neotest.summary.open() end,{silent = true})
vim.keymap.set('n', '<leader>to', function() neotest.output.open() end,{silent = true})
vim.keymap.set('n', '<leader>lc', function() coverage.load(true) end,{silent = true})
vim.keymap.set('n', '<leader>cs', function() coverage.summary() end,{silent = true})

