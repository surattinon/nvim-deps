local key = vim.keymap.set
local silent = { noremap = true, silent = true }

key("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[C]ode [F]ormat" })
