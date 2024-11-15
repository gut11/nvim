function totalLines()
	return vim.fn.line("$")
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c =
		{
			function()
				local filepath = vim.fn.expand('%:p')  -- Get the full file path
				local filename = vim.fn.expand('%:t')  -- Get the file name
				local dir = vim.fn.expand('%:h:t')     -- Get the current directory name
				local parent_dir = vim.fn.expand('%:h:h:t') -- Get the parent directory name
				return parent_dir .. '/' .. dir .. '/' .. filename -- Combine them
			end
		},
		lualine_x = { 'encoding', 'filetype', 'filesize', "fileformat", },
		lualine_y = { 'progress', 'totalLines()' },
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}





--[[
- `branch` (git branch)
- `buffers` (shows currently available buffers)
- `diagnostics` (diagnostics count from your preferred source)
- `diff` (git diff status)
- `encoding` (file encoding)
- `fileformat` (file format)
- `filename`
- `filesize`
- `filetype`
- `hostname`
- `location` (location in file in line:column format)
- `mode` (vim mode)
- `progress` (%progress in file)
- `searchcount` (number of search matches when hlsearch is active)
- `tabs` (shows currently available tabs)
- `windows` (shows currently available windows
--]]
