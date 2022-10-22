require("luasnip.loaders.from_vscode").lazy_load()





vim.api.nvim_command("inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>")
vim.api.nvim_command("snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>")
vim.api.nvim_command("snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")
vim.api.nvim_command("imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'")
vim.api.nvim_command("smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'")

















