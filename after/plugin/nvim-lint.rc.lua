local lint = require('lint')
local keymap = vim.keymap.set
local checkstyle = require('lint').linters.checkstyle

checkstyle.args = {
    '-c' , './.code_quality/checkstyle_rules.xml',
}

require('lint').linters.pmd = {
  cmd = 'pmd',
  stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
  args = { '-R', './.code_quality/pmd_rules.xml'}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  parser = your_parse_function
}

lint.linters_by_ft = {
  go = {'golangcilint'},
  java = {'checkstyle'},
  python = {'pylint','flake8','bandit','mypy'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

keymap('n','<leader>li',function() lint.try_lint() end, {silent = true})
