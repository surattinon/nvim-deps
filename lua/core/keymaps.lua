local key = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Clear search highlights when pressing <Esc> --
key("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode --
key("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- SPLIT WINDOW --
key("n", "ss", ":split<CR>", silent)
key("n", "sv", ":vsplit<CR>", silent)
