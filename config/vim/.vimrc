let mapleader = ","

" system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" exiting insert mode
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" disable Shift+Up/Down
noremap <S-Up> <Up>
noremap <S-Down> <Down>

" remove search highlight
set hlsearch
noremap <C-n> :nohl<CR>

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
nnoremap <space> zf

" automatic line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable mouse support
set mouse=a