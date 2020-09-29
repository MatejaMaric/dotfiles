set number
syntax on
set cindent
" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set mouse=a                             " Enable your mouse
" xsel needed?
set clipboard=unnamedplus               " Copy paste between vim and everything else

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

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

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

":help ftplugin
"autocmd FileType md nmap <buffer> <F10> !./gen.sh <enter> " doesn't work...
nnoremap <silent> <F10> :!./gen.sh <enter>

" You can't stop me
cmap w!! w !sudo tee %

autocmd BufWritePost *.md silent !markdown <afile> > plain.html
" autocmd BufWritePost *.md silent !markdown <afile> > <afile>:r.html

" run on current filename
" :autocmd BufWritePost * silent !run_tests.sh <afile>
" list auto commands
" :autocmd BufWritePost *
" remove all current auto commands
" :autocmd! BufWritePost *
