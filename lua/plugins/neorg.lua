require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.export"] = {},
		["core.esupports.metagen"] = {
			config = {
				type = "empty",
			}
		},
		["core.journal"] = {
			config = {
				strategy = "nested",
			}
		},
		["external.templates"] = {
			config = {
			templates_dir = "~/Documents/notes/templates",
			-- default_subcommand = "add", -- or "fload", "load"
			-- keywords = { -- Add your own keywords.
			--   EXAMPLE_KEYWORD = function ()
			--     return require("luasnip").insert_node(1, "default text blah blah")
			--   end,
			-- },
			-- snippets_overwrite = {},
			}
		},
		["core.concealer"] = {
			config = {
			}
		},
		["core.summary"] = {
			config = {
				strategy = "default",
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					default = "~/Documents/notes",
				},
				index = "index.norg", -- The name of the main (root) .norg file
			}
		}
	}
})
