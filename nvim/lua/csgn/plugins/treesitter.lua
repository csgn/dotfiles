return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('nvim-treesitter.config').setup({
            sync_install = false,
            auto_install = true,
            ignore_install = { "scala", "help" },
            indent = { enable = true, disable = { "yaml" } },
            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                disable = { "scala" },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = true,
            },
        })
    end,
}