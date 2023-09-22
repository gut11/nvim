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
	"tsserver",
	"quick_lint_js",
	"bashls",
	"lua_ls",
	"cssls",
	"emmet_ls",
	"cssmodules_ls",
	"html",
	"jdtls",
	"jsonls",
	"intelephense",
	"tailwindcss",
	"marksman"
}

lsps.linters_formatters = {
	"black",
	"flake8",
	"php-cs-fixer",
	"mdformat"
}

lsps.all = concatenate_tables(lsps.list, lsps.linters_formatters)



function lsps.configs(lspConfig, lsp, capabilities, on_attach)
	if lsp == "lua_ls" then
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
	elseif lsp == "emmet_ls" then
		lspConfig.emmet_ls.setup {
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
		}
	elseif lsp == "tsserver" then
		lspConfig.tsserver.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				javascript = {
					format = {
						semicolons = "insert",
					},
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
				typescript = {
					format = {
						semicolons = "insert",
					},
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
			},
			init_options = {
				hostInfo = "neovim",
			}
		}
	elseif lsp == "jdtls" then
		--being handled by nvim-jdtls
	elseif lsp == "pyright" then
		lspConfig.pyright.setup {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true
					}
				}
			}
		}
	else
		return false
	end
	return true
end

return lsps
