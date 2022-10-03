call plug#begin()

" FileManager
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'

" Bar
Plug 'https://github.com/vim-airline/vim-airline'

" LSP AutoComplete SyntaxHighlighting 
Plug  'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'  
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp' 
Plug 'hrsh7th/cmp-nvim-lsp' 
Plug 'saadparwaiz1/cmp_luasnip' 
Plug 'L3MON4D3/LuaSnip'

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

colorscheme tokyonight 
map Y y$
map <silent>f :lua vim.lsp.buf.formatting_sync() <CR>
nnoremap <silent>e :NvimTreeToggle <CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
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
nnoremap <silent><M-c> <Cmd>Bdelete<CR>



" Lua


lua << EOF

vim.g.loaded = 1 
vim.g.loaded_netrwPlugin = 1
require("plugins.nvim-tree")
require("plugins.lspconfigCmpMason")
require("plugins.nvim-treesitter")
require('plugins.bufferline')

EOF
