local lsp_opts = {
	servers = {
		lua_ls = {},
	},
}

local mason_opts = {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer"
	},
}

Add({
	source = "neovim/nvim-lspconfig",
	depends = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
	},
})

local lspconfig = require("lspconfig")
for server, config in pairs(lsp_opts.servers) do
	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
	lspconfig[server].setup(config)
end

require("mason").setup()
require("mason-lspconfig").setup(mason_opts)
