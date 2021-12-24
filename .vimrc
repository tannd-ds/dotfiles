" KEY CONFIGURATION ---------------------------------------------------------------------
"" Remap the ESC Key.
inoremap jk <ESC>

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file dectection. Vim will be able to try to detect the type of file in use.
filetype on

" DISPLAY CONFIGURATION -----------------------------------------------------------------
syntax on " highlight syntax.
set relativenumber " Show line relative numbers
set ruler " Show file stats
set noswapfile " disable the swapfile
set hlsearch " highlight all results

" Highlight cursor line underneath the cursor horizontally
"" set cursorline

" Set shift width to 4 spaces
set shiftwidth=4
set tabstop=4

" Enable auto completion menu after pressing TAB.
set wildmenu

