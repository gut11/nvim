local util = {}
DiagnosticMode = 1;
DiagnosticState = true;
TransparencyState = false;

function util.toggleDiagnosticMode()
	if DiagnosticMode == 1 then
		vim.diagnostic.config({
			virtual_text = true,
		})
		DiagnosticMode = 2
	else
		vim.diagnostic.config({
			virtual_text = false,
		})
		DiagnosticMode = 1
	end
end

function util.toggleDiagnosticState()
	if DiagnosticState then
		vim.diagnostic.disable()
	else
		vim.diagnostic.enable()
	end
	DiagnosticState = not DiagnosticState
end

function util.toggleTransparency()
	local colorscheme = vim.api.nvim_command_output("colorscheme")
	if not TransparencyState then
		vim.cmd("hi Normal guibg=none ctermbg=none")
		vim.cmd("hi LineNr guibg=none ctermbg=none")
		vim.cmd("hi Folded guibg=none ctermbg=none")
		vim.cmd("hi NonText guibg=none ctermbg=none")
		vim.cmd("hi SpecialKey guibg=none ctermbg=none")
		vim.cmd("hi VertSplit guibg=none ctermbg=none")
		vim.cmd("hi SignColumn guibg=none ctermbg=none")
		vim.cmd("hi EndOfBuffer guibg=none ctermbg=none")
		vim.cmd("hi NormalNC guibg=none ctermbg=none")
	else
		vim.cmd("colorscheme " .. colorscheme)
	end
	TransparencyState = not TransparencyState
end

function util.open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

return util
