-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- ======================
-- Normal mode
-- ======================

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>", opts)

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+y', { desc = "Yank line to clipboard" })

-- ======================
-- Visual mode
-- ======================

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move selected text
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', opts)

-- Clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })

-- ======================
-- Visual block mode
-- ======================

vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ======================
-- Insert mode
-- ======================

-- Jump to end of line
vim.keymap.set("i", "<C-e>", "<C-o>A", opts)


vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false                                 -- disable backup files
vim.opt.swapfile = false                               -- disable swap files
vim.opt.fileencoding = "utf-8"                         -- file encoding for writes
vim.opt.nu = true                                      -- show absolute line numbers
vim.opt.relativenumber = true                          -- show relative line numbers
vim.opt.showmode = false                               -- hide mode indicator (INSERT/NORMAL)
vim.opt.mouse = "a"                                    -- enable mouse support in all modes
vim.opt.termguicolors = true                           -- enable true color support
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- directory for undo history
vim.opt.undofile = true                                -- enable persistent undo
vim.opt.expandtab = false                              -- use tabs, not spaces
vim.opt.shiftwidth = 4                                 -- spaces per indentation level
vim.opt.tabstop = 4                                    -- visual width of a tab
vim.opt.smartindent = true                             -- enable smart indentation
vim.opt.cursorline = true                              -- highlight the current line
vim.opt.scrolloff = 8                                  -- keep lines visible above/below cursor
vim.opt.sidescrolloff = 8                              -- keep columns visible left/right of cursor
vim.opt.wrap = false                                   -- disable line wrapping
vim.opt.hlsearch = false                               -- disable persistent search highlight
vim.opt.incsearch = true                               -- show matches while typing search
vim.opt.updatetime = 50                                -- faster CursorHold and diagnostics
vim.opt.colorcolumn = "80"                             -- show column guide at 80 chars
vim.opt.shortmess:append("c")                          -- suppress completion messages
vim.opt.nuw = 1                                        -- minimal number column width

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7F00FF", bg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#dddddd", bg = "#000000" })

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow cursor wrap with arrow keys
vim.cmd([[set iskeyword+=-]])         -- treat hyphenated words as single words

-- Line number highlighting
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7F00FF", bg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#dddddd", bg = "#000000" })

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow cursor wrap with arrow keys
vim.cmd([[set iskeyword+=-]])         -- treat hyphenated words as single words

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},
	defaults = { lazy = true },
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = true },
	change_detection = { notify = false, },
})
