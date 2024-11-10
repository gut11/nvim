local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black.with({
			extra_args = { "--unstable" }
		}),
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.mdformat.with({
			extra_args = { "-number" },
		})
	},
})
