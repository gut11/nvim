call plug#begin()



" FileManager
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'

" Bar
Plug 'https://github.com/nvim-lualine/lualine.nvim'

" LSP AutoComplete SyntaxHighlighting 
Plug  'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'  
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp' 
Plug 'hrsh7th/cmp-nvim-lsp' 

" Show errors
Plug 'folke/trouble.nvim'

" Snipets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'https://github.com/rafamadriz/friendly-snippets'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'

" File Paths
Plug 'https://github.com/hrsh7th/cmp-path'

" Themes
Plug 'https://github.com/Mofiqul/dracula.nvim'  
Plug 'https://github.com/folke/tokyonight.nvim'

" Tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'https://github.com/moll/vim-bbye'

call plug#end()

" Neovim Configs
set number
set tabstop=4
set shiftwidth=4
set mouse=a

colorscheme tokyonight-storm 
map Y y$
map <silent><leader>f :lua vim.lsp.buf.formatting_sync() <CR>
map <silent><leader>s :w <CR>
map <silent><leader>Q :q! <CR>
map <silent><leader>c :q <CR>
nnoremap <silent>e :NvimTreeToggle <CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
map <Leader><Space> :noh<CR>
nnoremap <silent><M-l> :BufferLineCycleNext<CR>
nnoremap <silent><M-h> :BufferLineCyclePrev<CR>
nnoremap <silent><M-right> :BufferLineCycleNext<CR>
nnoremap <silent><M-left> :BufferLineCyclePrev<CR>
nnoremap <silent><M-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><M-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><M-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><M-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><M-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><M-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><M-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><M-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><M-9> <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><M-$> <Cmd>BufferLineGoToBuffer -1<CR>
nnoremap <silent><M-c> <Cmd>Bdelete!<CR>
nnoremap <silent><M-d> <Cmd>TroubleToggle<CR>


" Lua


lua << EOF

vim.g.loaded = 1 
vim.g.loaded_netrwPlugin = 1


require("plugins.luasnip")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.lspconfigCmpMason")
require("plugins.nvim-treesitter")
require("plugins.trouble")
require('plugins.bufferline')



util = require('util')
vim.keymap.set('n', '<leader>d', util.toggleDiagnostics)




EOF




