local null_ls = require("null-ls")
local formatters = {"prettier"}
local sources = {}


for _, formatter in ipairs(formatters) do
	table.insert(sources,null_ls.builtins.formatting[formatter])
end



null_ls.setup({sources = sources})
