if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "html",
    "scss",
    "bash",
    "python",
    "css",
    "javascript",
    "dockerfile",
    "go",
    "graphql",
    "java",
    "http",
    "markdown",
    "proto",
    "scala",
    "sql",
    "vim",
    "vue",
    "c",
    "cpp",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
