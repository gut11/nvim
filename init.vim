call plug#begin()
" Lua Nvim library
Plug 'nvim-lua/plenary.nvim'
" File Navigation
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'
Plug 'https://github.com/nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'ThePrimeagen/harpoon'
" Bar
Plug 'https://github.com/nvim-lualine/lualine.nvim'
" LSP AutoComplete 
Plug  'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
" Formating
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'
" Snipets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'https://github.com/rafamadriz/friendly-snippets'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'
" File Paths
Plug 'https://github.com/hrsh7th/cmp-path'
" Theme
Plug 'https://github.com/Mofiqul/dracula.nvim'  
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'https://github.com/catppuccin/nvim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'https://github.com/thimc/gruber-darker.nvim'
Plug 'https://github.com/Mofiqul/vscode.nvim'
" Tmux
Plug 'https://github.com/christoomey/vim-tmux-navigator'
" Closers(){}[]
Plug 'windwp/nvim-autopairs'
" Comments 
Plug 'numToStr/Comment.nvim'
" Sudo inside nvim
Plug 'https://github.com/lambdalisue/suda.vim'

call plug#end()
" Neovim Configs
set tabstop=4
set shiftwidth=4
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.asm set filetype=nasm
set mouse=a
set scrolloff=5 " Keep 5 lines below and above the cursor
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
" Formats
map <silent><leader>f <Cmd>lua vim.lsp.buf.format()<CR>
" Save
map <silent><leader>s <Cmd>w<CR>
map <leader>S :w!!<CR>
" Move between splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" Better ctrl-d/u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
"Open nvim tree
nnoremap <silent>e <Cmd>NvimTreeToggle<CR>
" Clear Search Highlight
map <Leader><Space> <Cmd>noh<CR>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!**/.git/*<cr>
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <M-m> <cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>
" Requires Ripgrep
nnoremap <leader>gf <cmd>Telescope live_grep<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
" Grep the current buffer (gc = grep current)
nnoremap <leader>gc <cmd>Telescope current_buffer_fuzzy_find<cr> 
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Buffers
nnoremap <silent><leader>m <cmd>:lua require('harpoon.mark').add_file()<CR>
nnoremap <silent><M-right> <Cmd>:lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent><M-left> <Cmd>:lua require("harpoon.ui").nav_prev()<CR>
nnoremap <silent><M-1> <Cmd>:lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><M-2> <Cmd>:lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><M-3> <Cmd>:lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><M-4> <Cmd>:lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><M-5> <Cmd>:lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent><M-6> <Cmd>:lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <silent><M-7> <Cmd>:lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <silent><M-8> <Cmd>:lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <silent><M-9> <Cmd>:lua require("harpoon.ui").nav_file(9)<CR>
nnoremap <silent><M-0> <Cmd>:lua require("harpoon.ui").nav_file(10)<CR>
nnoremap <silent><M-c> <Cmd>:bd<CR>
" Save as sudo
ca w!! SudaWrite
" Fix delay on ESC
set timeoutlen=1000
set ttimeoutlen=50


function BigFileSetup()
	set noswapfile
	set foldmethod=manual
endfunction

augroup BigFileDisable
    autocmd!
    autocmd VimEnter,BufReadPre,FileReadPre * if getfsize(expand("%")) > 512 * 1024 | exec BigFileSetup() | endif
augroup END

" Lua
lua << EOF
require("plugins.luasnip")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.mason")
require("plugins.lspconfig")
require("plugins.null-ls")
require("plugins.nvim-autopairs")
require("plugins.telescope")
require("plugins.comment")
funcs = require('myFunctions')
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = funcs.open_nvim_tree })
vim.keymap.set('n', '<M-l>', funcs.mruBufferNext)
vim.keymap.set('n', '<M-h>', funcs.mruBufferPrev)
EOF
