local util = {}
local mruBuffersTable = {}
local mruBuffersTableLength = 0
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
	local colorscheme = nvim.nvim_exec2("colorscheme", { output = true }).output
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
	if not string.find(mruBuffers, "\n") then
		mruBuffers = mruBuffers .. "\n"
	end
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


local function changeBuffer(bufferNumber)
	nvim.nvim_exec2("b " .. bufferNumber, {})
end

function util.mruBufferPrev()
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
		mruBuffersTableLength = #mruBuffersTable
		if mruBuffersTableLength <= 1 then
			return
		end
		local bufferToGoNumber = mruBuffersTable[2]
		changeBuffer(bufferToGoNumber)
		currentBufferIndex = 2
	else
		local bufferToGoIndex
		if currentBufferIndex == #mruBuffersTable then
			bufferToGoIndex = 1
		else
			bufferToGoIndex = currentBufferIndex + 1
		end
		local bufferToGoToNumber = mruBuffersTable[bufferToGoIndex]
		changeBuffer(bufferToGoToNumber)
		currentBufferIndex = bufferToGoIndex;
	end
	bufferChangedWithoutMru = false
end

function util.mruBufferNext()
	if bufferChangedWithoutMru then
		mruBuffersTable = generateMruTable()
		mruBuffersTableLength = #mruBuffersTable
		if mruBuffersTableLength <= 1 then
			return
		end
		local bufferToGoNumber = mruBuffersTable[mruBuffersTableLength]
		changeBuffer(bufferToGoNumber)
		currentBufferIndex = mruBuffersTableLength
	else
		local bufferToGoIndex
		if currentBufferIndex == 1 then
			bufferToGoIndex =
				mruBuffersTableLength
		else
			bufferToGoIndex = currentBufferIndex - 1
		end
		local bufferToGoNumber = mruBuffersTable[bufferToGoIndex]
		changeBuffer(bufferToGoNumber)
		currentBufferIndex = bufferToGoIndex
	end
	bufferChangedWithoutMru = false
end

return util
