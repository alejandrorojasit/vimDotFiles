local treesitter = require ('nvim-treesitter.configs')

treesitter.setup{
  ensure_installed = {'java','go','vim','lua','tsx','sql','yaml','scheme','regex','python','json','javascript','http','html','gomod','gdscript','dockerfile','css','comment','bash','org','typescript','sql','markdown','gowork','gomod'},
  indent = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_line = nil,
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
