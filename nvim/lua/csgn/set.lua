-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20" -- custom cursor shapes per mode

vim.opt.backup = false         -- disable backup files
vim.opt.swapfile = false      -- disable swap files

vim.opt.fileencoding = "utf-8" -- file encoding for writes

vim.opt.nu = true              -- show absolute line numbers
vim.opt.relativenumber = true  -- show relative line numbers

vim.opt.showmode = false       -- hide mode indicator (INSERT/NORMAL)
vim.opt.mouse = "a"            -- enable mouse support in all modes

vim.opt.termguicolors = true   -- enable true color support

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- directory for undo history
vim.opt.undofile = true        -- enable persistent undo

vim.opt.expandtab = false      -- use tabs, not spaces
vim.opt.shiftwidth = 4         -- spaces per indentation level
vim.opt.tabstop = 4            -- visual width of a tab

-- vim.opt.softtabstop = 0      -- disable soft tab width
-- vim.opt.smarttab = true      -- smarter tab behavior

vim.opt.smartindent = true     -- enable smart indentation
-- vim.opt.autoindent = true    -- keep indentation from previous line

vim.opt.cursorline = true      -- highlight the current line

vim.opt.scrolloff = 8          -- keep lines visible above/below cursor
vim.opt.sidescrolloff = 8      -- keep columns visible left/right of cursor

vim.opt.wrap = false           -- disable line wrapping

vim.opt.hlsearch = false       -- disable persistent search highlight
vim.opt.incsearch = true       -- show matches while typing search

vim.opt.updatetime = 50        -- faster CursorHold and diagnostics

vim.opt.colorcolumn = "80"     -- show column guide at 80 chars

vim.opt.shortmess:append("c")  -- suppress completion messages

vim.opt.nuw = 1                -- minimal number column width
-- vim.opt.signcolumn = "no"    -- disable sign column

-- Line number highlighting
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7F00FF", bg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove",   { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "LineNrBelow",   { fg = "#dddddd", bg = "#000000" })

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow cursor wrap with arrow keys
vim.cmd([[set iskeyword+=-]])         -- treat hyphenated words as single words
