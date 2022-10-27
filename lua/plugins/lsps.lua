local lsps = {}
lsps.list = {
	"clangd",
	"rust_analyzer",
	"pyright",
	"tsserver",
	"quick_lint_js",
	"bashls",
	"sumneko_lua",
	"cssls",
	"emmet_ls",
	"cssmodules_ls",
	"html",
	"jdtls",
	"jsonls",
}




function lsps.configs(lspConfig, lsp, capabilities, on_attach)
	if lsp == "sumneko_lua" then
		lspConfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		})
	elseif lsp == "emmet_ls" then
		lspConfig.emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			}
		})
	else
		return false
	end
	return true
end

return lsps 
