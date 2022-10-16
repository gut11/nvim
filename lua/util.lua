local util = {}
DiagnosticState = true;

function util.toggleDiagnostics()
	if diagnosticState then
		vim.diagnostic.hide()
	else
		vim.diagnostic.show()
	end
	diagnosticState = not diagnosticState
	print(diagnosticState)
end




return util
