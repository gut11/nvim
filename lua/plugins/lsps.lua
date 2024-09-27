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
	"angularls",
	"omnisharp",
	"marksman",
	"gopls",
	"asm_lsp",
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
	"sql-formatter"
}

lsps.all = concatenate_tables(lsps.list, lsps.linters_formatters)

local pid = vim.fn.getpid()

function lsps.configs(lspConfig, lsp, capabilities, on_attach)
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
		-- elseif lsp == "pylsp" then
		-- 	lspConfig.pylsp.setup {
		-- 		on_attach = on_attach,
		-- 		capabilities = capabilities,
		-- 		settings = {
		-- 			pylsp = {
		-- 				plugins = {
		-- 					yapf = { enabled = false, },
		-- 					rope_autoimport = { enabled = true },
		-- 					ruff = { enabled = true, },
		-- 					isort = { enabled = true, },
		-- 					rope = { enabled = true, },
		-- 					memestra = { enabled = true, },
		-- 					pycodestyle = {
		-- 						ignore = { 'W391' },
		-- 						maxLineLength = 100
		-- 					}
		-- 				}
		-- 			}
		-- 		}
		-- 	}
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
	elseif lsp == "omnisharp" then
		lspConfig.omnisharp.setup {
			cmd = { "dotnet", "/home/gut11/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },


			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			enable_editorconfig_support = true,

			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			enable_ms_build_load_projects_on_demand = false,

			-- Enables support for roslyn analyzers, code fixes and rulesets.
			enable_roslyn_analyzers = false,

			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			organize_imports_on_format = false,

			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			enable_import_completion = true,

			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			sdk_include_prereleases = true,

			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			analyze_open_documents_only = false,
			root_dir = lspConfig.util.root_pattern(".sln", ".csproj", ".git"),
			on_attach = on_attach,
			capabilities = capabilities
		}
	else
		return false
	end
	return true
end

return lsps
