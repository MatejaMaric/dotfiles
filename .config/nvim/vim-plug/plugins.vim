" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Delete matching pairs with ds(
    Plug 'tpope/vim-surround'
    " Auto comment
    Plug 'preservim/nerdcommenter'
    " Colorize
    Plug 'norcalli/nvim-colorizer.lua'
    " Airline - Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Snippets
    Plug 'honza/vim-snippets'
    " Vim-Which-Key > SpaceVim plugin
    Plug 'liuchengxu/vim-which-key'

call plug#end()
