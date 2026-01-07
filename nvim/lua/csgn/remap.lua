-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
})

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

-- vim.keymap.set("n", "<Up>", "<nop>", { silent = true })
-- vim.keymap.set("n", "<Down>", "<nop>", { silent = true })
-- vim.keymap.set("n", "<Left>", "<nop>", { silent = true })
-- vim.keymap.set("n", "<Right>", "<nop>", { silent = true })
