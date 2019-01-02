if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-clang-format'
call plug#end()
" Editor functionality
set history=500
set autoread
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set wildmenu

" Filetype/Syntax
filetype plugin indent on
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

" Editor look
set number
set relativenumber
set cmdheight=2
set so=7
set colorcolumn=81

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_sort_options = "i"
let g:netrw_list_hide = '\.o$, \.obj$,'
let g:netrw_list_hide .= '\.a$, \.so$, \.lib$,'
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END

" Clang-Format
autocmd FileType c ClangFormatAutoEnable

set ruler
