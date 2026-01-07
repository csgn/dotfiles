return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        require("ibl").setup()
    end,
}