call plug#begin()

" FileManager
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'

" Bar
Plug 'https://github.com/vim-airline/vim-airline'

" LSP AutoComplete SyntaxHighlighting 
Plug 'williamboman/mason.nvim'
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

call plug#end()

" Neovim Configs
set number
set tabstop=4
set shiftwidth=4
set mouse=a

colorscheme tokyonight 
map Y y$

" Lua
lua << EOF

vim.g.loaded = 1 
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
require("lspconfigCmpMason")
require("treesitter")

EOF
