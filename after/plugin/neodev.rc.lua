local neodev = require('neodev')
neodev.setup({
  library = { 
    plugins = { 
      "neotest",
      "nvim-dap-ui"
    }, types = true 
  },
})
