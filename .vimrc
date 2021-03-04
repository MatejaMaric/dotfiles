set number
syntax on
set cindent

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable your mouse
set mouse=a

" xsel needed for shared clipboard?
set clipboard=unnamedplus  " Copy paste between vim and everything else

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Using jk and kj instead of Esc
inoremap jk <Esc>
inoremap kj <Esc>

" Saving changes even if not root
cmap w!! w !sudo tee %
