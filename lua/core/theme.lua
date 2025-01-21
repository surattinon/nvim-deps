local opts = {
	integrations = {
		alpha = true,
		cmp = true,
		mason = true,

		mini = {
			enabled = true,
			indentscope_color = "text",
		},

		neotree = true,
		dap = true,
		dap_ui = true,

		-- NOTE: Theme for nvim-lspconfig
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},

		telescope = {
			enabled = true,
			style = "nvchad",
		},

		which_key = true,
	},

	transparent_background = false,
}
Add({
	source = "catppuccin/nvim",
}, opts)

vim.cmd([[colorscheme catppuccin-mocha]])
