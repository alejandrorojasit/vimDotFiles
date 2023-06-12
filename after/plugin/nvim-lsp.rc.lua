local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local keymap = vim.keymap.set
local jdtls = require('jdtls')
local bundles = {
  vim.fn.glob("/Users/alerojas/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/alerojas/.config/nvim/vscode-java-test/server/*.jar"), "\n"))

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.ltex.setup({
    on_attach = on_attach,
    cmd = {'ltex-ls'},
    filetypes = {'markdown','text','org'},
    flags = {debounce_text_changes = 300},
})

lspconfig.pyright.setup{
  capabilities = capabilities
}
lspconfig.tsserver.setup{
  capabilities = capabilities
}

lspconfig.gopls.setup{
  cmd = {'gopls'},
  -- for postfix snippets and analyzers
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

lspconfig.jdtls.setup({
  cmd = {
    '/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/Users/alerojas/.config/nvim/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/Users/alerojas/.config/nvim/jdt-language-server/config_mac',
    '-data', '/Users/alerojas/Proyectos/Java'
  },
  init_options = {
    bundles = bundles
  },
  capabilities = capabilities,
  on_attach = function(client,bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto'})
    jdtls.setup.add_commands()
  end,
})

keymap('n','<leader>bf', function()
  vim.lsp.buf.format {async = true}
end)

--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    vim.lsp.buf.format {async = true}
--  end,
--})

vim.diagnostic.config({
  virtual_text = false,
})
