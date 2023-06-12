local dap = require('dap')
local dapui = require('dapui')
local dapVsCode = require('dap-vscode-js')
vim.fn.sign_define('DapBreakpoint',
  {text = '🛑', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',
  {text = '⚠️ ', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
  {text = '⭐️', texthl = '', linehl = '', numhl = ''})

dap.adapters.python = {
  type = 'executable';
  command = '/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/debugpy';
  args = { '-m', 'debugpy.adapter' };
}

dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/.config/nvim/vscode-go/dist/debugAdapter.js'};
}

dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}

dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = '${workspaceFolder}/cmd/api/main.go';
    dlvToolPath =  vim.fn.exepath('/Users/alerojas/go/bin/dlv') -- Adjust to where delve is installed
  },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = 'Launch file';

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = '${file}'; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

for _, language in ipairs({ 'typescript', 'javascript' }) do
  dap.configurations[language] = {
    {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Debug Jest Tests',
        -- trace = true, -- include debugger info
        runtimeExecutable = 'node',
        runtimeArgs = {
          './node_modules/jest/bin/jest.js',
          '--runInBand',
        },
        rootPath = '${workspaceFolder}',
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        internalConsoleOptions = 'neverOpen',
      }
    },
  }
end

dapVsCode.setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

dapui.setup()

vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end,{silent = true})
vim.keymap.set('n', '<leader>dc', function() dap.continue() end,{silent = true})
vim.keymap.set('n', '<leader>so', function() dap.step_over() end,{silent = true})
vim.keymap.set('n', '<leader>sO', function() dap.step_out() end,{silent = true})
vim.keymap.set('n', '<leader>si', function() dap.step_into() end,{silent = true})
vim.keymap.set('n', '<leader>dui', function() dapui.toggle() end,{silent = true})



