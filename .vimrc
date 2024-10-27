if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-clang-format'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Treat *.{c,h} files as pure c not cpp
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Editor functionality
set ruler
set encoding=utf8
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
set splitbelow
set splitright
set backspace=2
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set visualbell
set noerrorbells

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
set cmdheight=1
set so=7
set colorcolumn=120
set background=dark
colorscheme solarized
hi MatchParen cterm=bold ctermbg=none ctermfg=red

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_sort_options = "i"
let g:netrw_list_hide = '\.o$, \.obj$,'
let g:netrw_list_hide .= '\.a$, \.so$, \.lib$,'

" Clang-Format
autocmd FileType c ClangFormatAutoEnable

" Re-Maps
nnoremap - :Lexplore<CR>
nnoremap fg :vertical wincmd f<CR>
nnoremap <S-z> za

" Term
nnoremap = :10new<CR>:term ++curwin<CR>
nnoremap + :55vnew<CR>:term ++curwin<CR>
tnoremap <Esc> <C-\><C-n>

" Move viewport as well as cursor
nnoremap <C-j> 5j<C-e>
nnoremap <C-k> 5k<C-y>

" Move horizontally around splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <silent> <C-w>H <C-w><
map <silent> <C-w>J <C-w>-
map <silent> <C-w>K <C-w>+
map <silent> <C-w>L <C-w>>

