Add({
	source = "hrsh7th/nvim-cmp",
	depends = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"R-nvim/cmp-r",
		"rafamadriz/friendly-snippets",
	}

})

local cmp = require("cmp")
cmp.setup({
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert({

		["<C-p>"] = cmp.mapping.scroll_docs(-4),
		["<C-n>"] = cmp.mapping.scroll_docs(4),

		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
	sources = {
		{
			name = "lazydev",
			-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
			group_index = 0,
		},
		{ name = "nvim_lsp" },
		{ name = "cmp_r" },
		{ name = "path" },
	},
})

require("cmp_r").setup({})
