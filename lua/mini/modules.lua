------------------
-- Text editing --
------------------

Mini("ai", {
	custom_textobjects = nil,

	mappings = {
		-- Main textobject prefixes
		around = "a",
		inside = "i",

		-- Next/last variants
		around_next = "an",
		inside_next = "in",
		around_last = "al",
		inside_last = "il",

		-- Move cursor to corresponding edge of `a` textobject
		goto_left = "g[",
		goto_right = "g]",
	},

	-- Number of lines within which textobject is searched
	n_lines = 50,

	-- How to search for object (first inside current line, then inside
	-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 'cover_or_nearest', 'next', 'previous', 'nearest'.

	search_method = "cover_or_next",
	silent = true,
})

Mini("comment", {})

Mini("completion", {
	mappings = {
		next = "<tab>",
		prev = "<S-tab",
	},
})
Mini("move", {})
Mini("operators", {})
Mini("pairs", {})
Mini("snippets", {})
Mini("splitjoin", {})

Mini("surround", {
	custom_surroundings = nil,

	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 500,

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "sa", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},

	-- Number of lines within which surrounding is searched
	n_lines = 20,

	respect_selection_type = false,

	search_method = "cover",
	silent = true,
})

-- General Workflow --
Mini("bracketed", {})
Mini("clue", {
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},
	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
	},
	window = { 
		delay = 300,
	}
})

Mini("diff", {
	-- Options for how hunks are visualized
	view = {
		style = "sign",
		signs = { add = "▏", change = "▏", delete = "▏" },
	},

	mappings = {
		apply = "gh",

		reset = "gH",

		textobject = "gh",

		goto_first = "[H",
		goto_prev = "[h",
		goto_next = "]h",
		goto_last = "]H",
	},
})

Mini("git", {})
Mini("jump", {})
Mini("jump2d", {})
Mini("misc", {})
Mini("pick", {})
Mini("files", {
	content = {
		filter = nil,
		prefix = nil,
		sort = nil,
	},
	mappings = {
		open = "-",
		close = "q",
		go_in = "l",
		go_in_plus = "L",
		go_out = "h",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},
	options = {
		permanent_delete = true,
		use_as_default_explorer = true,
	},

	-- Customization of explorer windows
	windows = {
		-- Maximum number of windows to show side by side
		max_number = math.huge,
		-- Whether to show preview of file/directory under cursor
		preview = true,
		-- Width of focused window
		width_focus = 50,
		-- Width of non-focused window
		width_nofocus = 15,
		-- Width of preview window
		width_preview = 80,
	},
})

Mini("sessions", {})

-----------------
-- Appearances --
-----------------

Mini("animate", {})
Mini("cursorword", {})
Mini("icons", {})
Mini("indentscope", {
	symbol = "▏",
})
Mini("starter", {})
Mini("statusline", {})
