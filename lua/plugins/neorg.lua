require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.export"] = {},
		["core.esupports.metagen"] = {
			config = {
				type = "auto",
			}
		},
		["core.journal"] = {
			config = {
				strategy = "flat"
			}
		},
		["core.concealer"] = {},
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
