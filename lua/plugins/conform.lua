local cf_opts = {
	formatters_by_ft = {
		lua = { "stylua" },
	},
	notify_on_error = true,
	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 500,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
}

MiniDeps.now(function()
	Add({
		source = "stevearc/conform.nvim",
	})
end)

require("conform").setup(cf_opts)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
