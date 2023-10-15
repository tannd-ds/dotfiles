call plug#begin()
" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Mofiqul/dracula.nvim'

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Fuzzy search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

"--- KEY MAPPING ------------------------------------------------
inoremap jk <ESC>l
let mapleader = "," " Rebind <Leader> key
" Sort
vnoremap <Leader>s :sort<CR>

nnoremap <Leader><TAB> :bn<CR>
map      <leader>N <ESC>:set nu! relativenumber!<CR>
" Removes highlight of last search
map      <F12> :nohl<CR>

" Color scheme
set t_Co=256
color dracula

filetype plugin indent on
syntax on
set nocompatible
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

hi  Normal guibg=NONE ctermbg=NONE
set number relativenumber
set cursorline
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set scrolloff=5

" Change tab witdh to 4
set tabstop=2
set shiftwidth=2

set history=700
set undolevels=700

set wildmenu
set wildmode=list:longest,full
set clipboard=unnamedplus

"---Plugin Configeration-------------------------------------------------------
"" vim-airline
set laststatus=2
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.linenr = ' '
let g:airline_symbols.colnr = ' '

"" TELESCOPE
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
