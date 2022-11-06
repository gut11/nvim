require("transparent").setup({
	enable = false, -- boolean: enable transparent
	extra_groups = {
		"NvimTreeNormal",
		"NvimTreeEndOfBuffer", "NvimTreeSymlink",
		"NvimTreeCursorLine", "BufferLineTabClose",
		"NvimTreeCursorLineNr", "BufferlineBufferSelected",
		"NvimTreeLineNr", "BufferLineFill",
		"NvimTreeWinSeparator", "BufferLineBackground",
		"NvimTreeWinSeparator", "BufferLineSeparator",
		"NvimTreeCursorColumn", "BufferLineIndicatorSelected",
	},
	exclude = {}, -- table: groups you don't want to clear
})
