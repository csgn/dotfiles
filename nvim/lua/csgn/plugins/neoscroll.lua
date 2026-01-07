return {
    "karb94/neoscroll.nvim",
    lazy = true,
    keys = {
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
    },
    config = function()
        local neoscroll = require("neoscroll")
        neoscroll.setup({
            easing = "quadratic"
        })

        local keymap = {
            ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250; easing = 'sine' }) end;
            ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250; easing = 'sine' }) end;
            ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450; easing = 'sine' }) end;
            ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450; easing = 'sine' }) end;
            ["<C-y>"] = function() neoscroll.scroll(-0.2, { move_cursor=false; duration = 100, easing = 'sine' }) end;
            ["<C-e>"] = function() neoscroll.scroll(0.2, { move_cursor=false; duration = 100, easing = 'sine' }) end;
        }
        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end,
}