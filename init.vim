call plug#begin()

" FileManager
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'

" Bar
Plug 'https://github.com/nvim-lualine/lualine.nvim'

" LSP AutoComplete 
Plug  'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'  
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Syntax Highlighting
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

" Diagnostics
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'

" Show errors
Plug 'folke/trouble.nvim'

" Snipets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'https://github.com/rafamadriz/friendly-snippets'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'

" File Paths
Plug 'https://github.com/hrsh7th/cmp-path'

" Themes
Plug 'https://github.com/Mofiqul/dracula.nvim'  
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'https://github.com/Mofiqul/vscode.nvim'

" Tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'https://github.com/moll/vim-bbye'

" Closers(){}[]
Plug 'windwp/nvim-autopairs'

" Sudo inside nvim
Plug 'https://github.com/lambdalisue/suda.vim'

call plug#end()

" Neovim Configs
set tabstop=4
set shiftwidth=4
set mouse=a

" Turn hybrid line numbers on
set number relativenumber
set nu rnu
set cursorline
" Change line numbers color
au colorscheme * hi LineNr guifg=#707187
au colorscheme * hi CursorLine guibg=NONE
au colorscheme * hi CursorLineNr guifg=bold

colorscheme tokyonight 

" My bindings
map Y y$
map <silent><leader>f <Cmd>lua vim.lsp.buf.format()<CR>
map <silent><leader>s <Cmd>w<CR>
map <leader>S <Cmd>w!!<CR>
map <silent><leader>Q <Cmd>q!<CR>
map <silent><leader>q <Cmd>q<CR>
nnoremap <silent>e <Cmd>NvimTreeToggle<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
" Clear Search Highlight
map <Leader><Space> <Cmd>noh<CR>
" Buffers/tabs
nnoremap <silent><M-l> <Cmd>BufferLineCycleNext<CR>
nnoremap <silent><M-h> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent><M-right> <Cmd>BufferLineCycleNext<CR>
nnoremap <silent><M-left> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent><M-S-l> <Cmd>BufferLineMoveNext<CR>
nnoremap <silent><M-S-h> <Cmd>BufferLineMovePrev<CR>
nnoremap <silent><M-S-right> <Cmd>BufferLineMoveNext<CR>
nnoremap <silent><M-S-left> <Cmd>BufferLineMovePrev<CR>
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
" Trouble
nnoremap <silent><M-d> <Cmd>TroubleToggle<CR>
" Save as sudo
ca w!! SudaWrite

" Set cursor to underline when leaving nvim
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

au VimLeave,VimSuspend * set guicursor=a:hor100-blinkwait125-blinkoff120-blinkon125

" Line numbers with diagnostic colors
sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError
sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn
sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo
sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint

" Lua
lua << EOF

vim.g.loaded = 1 
vim.g.loaded_netrwPlugin = 1


require("plugins.luasnip")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.mason")
require("plugins.lspconfig")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
require("plugins.trouble")
require('plugins.bufferline')
require("plugins.null-ls")
require("plugins.nvim-autopairs")





funcs = require('myFunctions')
vim.keymap.set('n', '<leader>d', funcs.toggleDiagnosticMode)
vim.keymap.set('n', '<leader>D', funcs.toggleDiagnosticState)
vim.keymap.set('n', '<leader>t', funcs.toggleTransparency)


EOF



