runtime ~/.vim/autoload/pathogen.vim
autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc
autocmd BufWritePre * %s/\s\+$//e " gets rid of extra space

let mapleader = "," " Rebind <Leader> key
inoremap jk <ESC>l

"---Key Binding with Ctrl-------------------------------------------------------

"---Key Binding with Leader Key------------------------------------------------
" Sort
vnoremap <Leader>s :sort<CR>

nnoremap <Leader><TAB> :tabn<CR>
" Removes highlight of last search
inoremap <Leader>n :nohl<CR>
noremap  <Leader>n :nohl<CR>
vnoremap <Leader>n :nohl<CR>

" Map F9 to compile and execute files
au filetype cpp nnoremap <F9> :w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('out').' && ./'.shellescape('out')<CR>
au filetype cpp inoremap <F9> <ESC>:w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('out').' && ./'.shellescape('out')<CR>
au filetype python  nnoremap <F9> :w <bar> exec '!clear && python3 '.shellescape('%')<CR>
" GDC Debuger
packadd termdebug
let g:termdebug_wide=1
" Auto close { bracket
inoremap {<CR> {<CR>}<ESC>O
map <leader>N <ESC>:set nu! relativenumber!<CR>

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
" Color scheme
set t_Co=256
color dracula

filetype plugin indent on
syntax on

set nocompatible
set nocp

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
"" vim-airline
set laststatus=2
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" NERDTree
let g:NERDTreeWinPos = "left" " Set NERDTree default Position
"autocmd vimenter * NERDTree " load up the nerd tree
map <Leader>t <plug>NERDTreeTabsToggle<CR>
" move to the first buffer
autocmd VimEnter * wincmd p

" auto-correction
ab iostraem iostream
ab inlucde include
ab incldue include
ab inlcude include

"" coc.vim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
