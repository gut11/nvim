call plug#begin()

" Lua Nvim library
Plug 'nvim-lua/plenary.nvim'

" File Navigation
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'
Plug 'https://github.com/nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Bar
Plug 'https://github.com/nvim-lualine/lualine.nvim'

" LSP AutoComplete 
Plug  'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'  
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
" Java LSP
Plug 'mfussenegger/nvim-jdtls'

" Syntax Highlighting
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

" Formating
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'

" Snipets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'https://github.com/rafamadriz/friendly-snippets'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'

" File Paths
Plug 'https://github.com/hrsh7th/cmp-path'

" Theme
Plug 'https://github.com/Mofiqul/dracula.nvim'  
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'https://github.com/catppuccin/nvim'
Plug 'https://github.com/Mofiqul/vscode.nvim'

" Tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator'

" Closers(){}[]
Plug 'windwp/nvim-autopairs'

" Comments 
Plug 'numToStr/Comment.nvim'

" Sudo inside nvim
Plug 'https://github.com/lambdalisue/suda.vim'

" Nvim api
Plug 'folke/neodev.nvim'

" Notes
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/ElPiloto/telescope-vimwiki.nvim'
Plug 'https://github.com/epwalsh/obsidian.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

" Neovim Configs

set tabstop=4
set shiftwidth=4
set mouse=a

" Long lines
nnoremap D dg$
nnoremap Y yg$
" Dont wrap lines in the middle of words
set linebreak
" Allow to move by visual lines but perfom commands by physical lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Turn hybrid line numbers on
set number relativenumber
set nu rnu
set cursorline

" Use xclip(or other tool depending on the system) for clipboard
set clipboard+=unnamedplus

" Change line numbers color
au colorscheme * hi LineNr guifg=#707187
au colorscheme * hi CursorLine guibg=NONE
au colorscheme * hi CursorLineNr guifg=bold

colorscheme catppuccin-frappe

" Formats
map <silent><leader>f <Cmd>lua vim.lsp.buf.format()<CR>
" Save
map <silent><leader>s <Cmd>w<CR>
map <leader>S :w!!<CR>
" Quit
map <silent><leader>Q <Cmd>q!<CR>
map <silent><leader>q <Cmd>q<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
" Better ctrl-d/u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
"Open nvim tree
nnoremap <silent>e <Cmd>NvimTreeToggle<CR>
" Clear Search Highlight
map <Leader><Space> <Cmd>noh<CR>
" Telescope
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>gf <cmd>Telescope live_grep<cr> " Requires Ripgrep
nnoremap <leader>gb <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <leader>gc <cmd>Telescope current_buffer_fuzzy_find<cr> " Grep the current buffer (gc = grep current)
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Buffers
nnoremap <silent><M-l> <Cmd>lua funcs.mruBufferNext()<CR>
nnoremap <silent><M-h> <Cmd>lua funcs.mruBufferPrev()<CR>
nnoremap <silent><M-right> <Cmd>bprevious<CR>
nnoremap <silent><M-left> <Cmd>bnext<CR>
nnoremap <silent><M-c> <Cmd>bd<CR>
map <C-C> <ESC> 
" Save as sudo
ca w!! SudaWrite
" Fix delay on ESC
set timeoutlen=1000
set ttimeoutlen=50

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

 "For vim-wiki
set nocompatible
filetype plugin on
syntax on

let g:vimwiki_list = [{'path': '~/Documents/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_filetypes = ['markdown']

" Lua
lua << EOF

--vim.g.vimwiki_filetypes = { "markdown" }
vim.g.loaded = 1 
vim.g.loaded_netrwPlugin = 1


require("plugins.luasnip")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.mason")
require("plugins.neodev")
require("plugins.lspconfig")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
require("plugins.null-ls")
require("plugins.nvim-autopairs")
require("plugins.telescope")
require("plugins.obsidian")
require('telescope').load_extension('vw')
require("plugins.comment")





funcs = require('myFunctions')
vim.keymap.set('n', '<leader>d', funcs.toggleDiagnosticMode)
vim.keymap.set('n', '<leader>D', funcs.toggleDiagnosticState)
vim.keymap.set('n', '<leader>t', funcs.toggleTransparency)
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = funcs.open_nvim_tree })


EOF



