call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
call plug#end() 

let g:ale_python_flake8_options = '--max-line-length=120'
 
let g:vimtex_view_general_viewer = 'evince'

" Set seoul256 theme and background color
let g:seoul256_srgb = 1
let g:seoul256_background = 234
colo seoul256

set tabstop=4
set softtabstop=4
set expandtab
set incsearch 
set hlsearch
inoremap jk <esc>
set clipboard+=unamed

" enable indentation
"set breakindent
"set breakindentopt=shift:4,min:40,sbr
"set showbreak=>>
