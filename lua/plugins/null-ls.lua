local null_ls = require("null-ls")
null_ls.setup ({
	sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.phpcsfixer,
	null_ls.builtins.formatting.mdformat.with({
		extra_args = { "-number" },
	})
	},
})
