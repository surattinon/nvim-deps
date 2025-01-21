local key = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Mini keymap --
key("n", "-", ":lua MiniFiles.open()<CR>", silent)
key("n", "<leader>ff", ":Pick files<CR>", silent)
