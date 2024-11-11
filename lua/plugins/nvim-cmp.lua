local cmp = require('cmp')
local luasnip = require("luasnip")


cmp.setup {
	completion = {
		autocomplete = false, -- Disable automatic popup
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		--completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item(), -- Navigate to the next item
		['<C-p>'] = cmp.mapping.select_prev_item(), -- Navigate to the previous item
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			select = false,
		}
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		--{ name = 'path' }
	},
}

vim.keymap.set({ "i", "s" }, "<C-p>", "<C-N>")
vim.keymap.set({ "i", "s" }, "<C-n>", "<C-N>")
