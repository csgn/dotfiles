return {
    "https://github.com/rhysd/clever-f.vim",
    lazy = true,
    config = function()
        vim.g.clever_f_not_overwrites_standard_mappings = 1
    end,
}