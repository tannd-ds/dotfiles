autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc
autocmd BufWritePre * %s/\s\+$//e " gets rid of extra space

call plug#begin()
Plug 'Raimondi/delimitMate'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Mofiqul/dracula.nvim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-fugitive'
call plug#end()

let mapleader = "," " Rebind <Leader> key
inoremap jk <ESC>l

"---Key Binding with Ctrl-------------------------------------------------------

"---Key Binding with Leader "Key------------------------------------------------
" Sort
vnoremap <Leader>s :sort<CR>

nnoremap <Leader><TAB> :tabn<CR>
" Removes highlight of last search
inoremap <Leader>n :nohl<CR>
noremap  <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>

" Map F9 to compile and execute files
"au filetype cpp nnoremap <F9> :w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('out').' && terminal ./'.shellescape('out')<CR>
"au filetype cpp inoremap <F9> <ESC>:w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('out').' && ./'.shellescape('out')<CR>
au filetype cpp nnoremap <F9> :w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('out') <bar> terminal ./out<CR>
au filetype python  nnoremap <F9> :w <bar> exec '!clear && python3 '.shellescape('%')<CR>
" Auto close { bracket
inoremap {<CR> {<CR>}<ESC>O
map <leader>N <ESC>:set nu! relativenumber!<CR>


filetype off
" Color scheme
set t_Co=256
color dracula

filetype plugin indent on
syntax on

set nocompatible

hi  Normal guibg=NONE ctermbg=NONE
set number " show line numbers
set relativenumber " show relativenumber
set cursorline
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set scrolloff=5
"set colorcolumn=80
"highlight ColorColumn ctermbg=233

" Change tab witdh to 4
set tabstop=4
set shiftwidth=4

set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

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

"" NERDTree
let g:NERDTreeWinPos = "left" " Set NERDTree default Position
map <Leader>t <plug>NERDTreeTabsToggle<CR>
" move to the first buffer
autocmd VimEnter * wincmd p

" auto-correction
ab iostraem iostream
ab inlucde include
ab incldue include
ab inlcude include