local util = {}
local mruBuffersTable = {}
local currentBufferIndex = 1
local bufferChangedWithoutMru = false
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
	local colorscheme = nvim.nvim_exec2("colorscheme", {output = true}).output
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

local function generateMruTable()
	local mruBuffers = nvim.nvim_exec2("ls t", { output = true }).output;
	local newMruBuffersTable = {};
	for bufferInfo in string.gmatch(mruBuffers, "[^\n]+") do
		local firstNonSpaceIndex = bufferInfo:find("[^ ]+")
		local bufferInfoWithoutInitialSpaces = bufferInfo:sub(firstNonSpaceIndex, bufferInfo:len())
		local spaceAfterBufferNumberIndex = bufferInfoWithoutInitialSpaces:find(" ")
		local bufferNumber = bufferInfoWithoutInitialSpaces:sub(1, spaceAfterBufferNumberIndex - 1)
		table.insert(newMruBuffersTable, bufferNumber)
	end
	return newMruBuffersTable
end


function On_buffer_changed()
	bufferChangedWithoutMru = true
end

vim.api.nvim_command('autocmd BufEnter * lua On_buffer_changed()')


function util.mruBufferPrev()
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
	end
	local currentBufferNumber = mruBuffersTable[currentBufferIndex]
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
		currentBufferIndex = 2
	else
		if currentBufferIndex == #mruBuffersTable then --if currentBufferIndex is the last one(the last buffer in the table)
			currentBufferIndex = 1               --set the currentBufferIndex to be the most recent(go back to the first buffer)
		else
			currentBufferIndex = currentBufferIndex + 1
		end
	end
	currentBufferNumber = mruBuffersTable[currentBufferIndex]
	nvim.nvim_exec2("b " .. currentBufferNumber, {})
	bufferChangedWithoutMru = false
end

function util.mruBufferNext()
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
	end
	local currentBufferNumber = mruBuffersTable[currentBufferIndex]
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
		currentBufferIndex = #mruBuffersTable
	else
		if currentBufferIndex == 1 then --if currentBufferIndex is the last one(the last buffer in the table)
			currentBufferIndex = #
				mruBuffersTable   --set the currentBufferIndex to be the most recent(go back to the first buffer)
		else
			currentBufferIndex = currentBufferIndex - 1
		end
	end
	currentBufferNumber = mruBuffersTable[currentBufferIndex]
	nvim.nvim_exec2("b " .. currentBufferNumber, {})
	bufferChangedWithoutMru = false
end

return util
