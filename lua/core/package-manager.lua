-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		-- Uncomment next line to use 'stable' branch
		-- '--branch', 'stable',
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

-- Package manage Setup
require("mini.deps").setup({
	path = { package = path_package },
})

MiniDeps.add({ name = "mini.nvim", checkout = "stable" })

-- Function to require all Lua files in a specified directory
function Load_plugin_from(folder_name)
	local plugins_dir = vim.fn.stdpath("config") .. "/lua/" .. folder_name .. "/"
	local scan = vim.loop.fs_scandir(plugins_dir)
	if not scan then
		print("Directory not found: " .. plugins_dir)
		return
	end
	while true do
		local name, type = vim.loop.fs_scandir_next(scan)
		if not name then
			break
		end
		if type == "file" and name:sub(-4) == ".lua" then
			local module_name = name:sub(1, -5)
			require(folder_name .. "." .. module_name)
		end
	end
end

-- Function to set up Mini plugins with a concise syntax
function Mini(plugin_name, options)
	local plugin = require("mini." .. plugin_name)
	plugin.setup(options)
	
	-- Execute the keymap function if it exists
	if options.custom_keymap and type(options.custom_keymap) == "function" then
		options.custom_keymap()
	end
end

Add = MiniDeps.add
