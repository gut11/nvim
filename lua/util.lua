local util = {}
DiagnosticState = true;

function util.toggleDiagnostics()
	if DiagnosticState then
		vim.diagnostic.hide()
	else
		vim.diagnostic.show()
	end
	DiagnosticState = not DiagnosticState
	print(DiagnosticState)
end

return util
