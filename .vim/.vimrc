runtime ~/.vim/autoload/pathogen.vim
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc
autocmd BufWritePre * %s/\s\+$//e " gets rid of extra space

let mapleader = "," " Rebind <Leader> key
inoremap jk <ESC>l

"---Key Binding with Ctrl-------------------------------------------------------
" Removes highlight of last search
noremap  <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" Jump windows by Ctrl <movement> instead of Ctrl w <movement>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

"---Key Binding with Leader Key------------------------------------------------
" Moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" Sort
vnoremap <Leader>s :sort<CR>

" Map F9 to compile and execute .cpp files
au filetype cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('out').' && ./'.shellescape('out')<CR>
inoremap {<CR> {<CR>}<ESC>O " Auto close { bracket

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
" Color theme
set t_Co=256
color dracula

filetype plugin indent on
syntax on

set nocompatible
set nocp

set number " show line numbers
set relativenumber " show relativenumber
set cursorline
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
"set colorcolumn=80
highlight ColorColumn ctermbg=233
"highlight CursorLineNr ctermfg=148 " hightlight Current Line Number

" Change tab witdh to 4
set tabstop=4
set shiftwidth=4

" Useful settings
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
"" vim-powerline
set laststatus=2
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'filename'

"" NERDTree
let g:NERDTreeWinPos = "left" " Set NERDTree default Position
"autocmd vimenter * NERDTree " load up the nerd tree
map <Leader>t <plug>NERDTreeTabsToggle<CR>
" move to the first buffer
autocmd VimEnter * wincmd p
