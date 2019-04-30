autocmd! bufwritepost .vimrc source %

set encoding=utf-8
let mapleader = ","

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here 

Plugin 'vim-scripts/indentpython.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'

Plugin 'srcery-colors/srcery-vim'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" automatic line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable mouse support
set mouse=a

" remove search highlight
set hlsearch
noremap <C-n> :nohl<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split behavior
set splitbelow
set splitright

" text wraping and visual guide
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" color scheme
set t_Co=256
colorscheme srcery

" ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" python-mode
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" exiting insert mode
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

