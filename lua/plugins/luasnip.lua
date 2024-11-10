local ls = require("luasnip")

-- ls.config.set_config {
--                 history = false,
-- 				region_check_events = 'InsertEnter',
-- 				delete_check_events = 'InsertLeave',
-- 				enable_autosnippets = true,
--             }
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = false})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = false})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = false})
