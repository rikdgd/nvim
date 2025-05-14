vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
keymap("n", "<leader>w", ":w<CR>", opts)                 -- Save
keymap("n", "<leader>q", ":q<CR>", opts)                 -- Quit
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)        -- Clear search highlight

-- File tree
keymap("n", "<leader>et", ":NvimTreeToggle<CR>", opts)    -- Toggle file tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)      -- Navigate to file tree

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
