local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Space as Leader Key --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.mallocalleader = " "

-- Normal Mode --
-- ----------- --
-- Window Control --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<Leader>e", ":Lex 30<cr>", opts)
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Window Resize --
keymap("n", "<C-Up>", "resize -2<CR>", opts)
keymap("n", "<C-Down>", "resize +2<CR>", opts)
keymap("n", "<C-Left>", "vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert Mode --
-- Press jk instead of Esc
keymap("i", "jk", "<Esc>", opts)

keymap("i", "<C-h>", "<Esc>I", opts)
keymap("i", "<C-l>", "<Esc>A", opts)

keymap("i", "<C-Enter>", "<Esc>o", opts)

-- Visual Mode --
-- Stay in indent mode --
-- Move text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)
