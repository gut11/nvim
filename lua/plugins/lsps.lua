local lsps = {};

local function concatenate_tables(table1, table2)
	local result = {}
	for _, v in ipairs(table1) do
		table.insert(result, v)
	end
	for _, v in ipairs(table2) do
		table.insert(result, v)
	end
	return result
end

lsps.list = {
	"clangd",
	"rust_analyzer",
	"pyright",
	"ts_ls",
	"bashls",
	"lua_ls",
	"cssls",
	"emmet_ls",
	"cssmodules_ls",
	"html",
	"htmx",
	"jdtls",
	"jsonls",
	"intelephense",
	"tailwindcss",
	"angularls",
	"omnisharp",
	"marksman",
	"gopls",
	"asm_lsp",
	"quick_lint_js",
	"templ",
	"texlab"
}

lsps.linters_formatters = {
	"black",
	"flake8",
	"ruff",
	"php-cs-fixer",
	"mdformat",
	"beautysh",
	"prettier",
	"sql-formatter",
	"latexindent"
}

lsps.all = concatenate_tables(lsps.list, lsps.linters_formatters)

function lsps.configs(lspConfig, lsp, capabilities, on_attach)
	local util = lspConfig.util
	if lsp == "asm_lsp" then
		lspConfig.asm_lsp.setup {
			settings = {
				command = "asm-lsp",
				filetypes = {
					"asm", "s", "S"
				}
			}
		}
	elseif lsp == "lua_ls" then
		lspConfig.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		}
	elseif lsp == "htmx" then
		lspConfig.htmx.setup({
			on_attach = on_attach,
			filetypes = { "html", "templ" },
		})
	elseif lsp == "emmet_ls" then
		lspConfig.emmet_ls.setup {
			on_attach = on_attach,
			filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', "templ" },
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			}
		}
	elseif lsp == "jdtls" then
		--being handled by nvim-jdtls
	else
		return false
	end
	return true
end

return lsps
