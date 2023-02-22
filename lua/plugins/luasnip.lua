require("luasnip").config.set_config {
                history = false,
				region_check_events = 'InsertEnter',
				delete_check_events = 'InsertLeave',
				enable_autosnippets = false,
            }

require("luasnip.loaders.from_vscode").lazy_load()




















