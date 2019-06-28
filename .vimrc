set number
set autoindent
set copyindent
set tabstop=4
set sw=4
set expandtab
set shiftround
set showmatch
set smarttab
set hls
set incsearch 
set wmh=0
set fdm=syntax
set linebreak
set laststatus=2
" set colorcolumn=80 " see if needed
set cursorline
set formatoptions+=cro
set noswapfile
nnoremap <F1> <nop> " stop mapping help to f1
syntax enable

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'leafgarland/typescript-vim'
call plug#end()

" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" basic FZF setup (maybe inlcude plugin later)
set rtp+=/usr/local/opt/fzf
nmap <C-p> :FZF<CR>

" Remap Leader to comma, easy to reach
let mapleader=","

" Quickly change from tab to tab
tnoremap <Leader>[ <C-\><C-n>gT
tnoremap <Leader>] <C-\><C-n>gt
noremap <Leader>[ gT
noremap <Leader>] gt
inoremap <Leader>[ <Esc>gT
inoremap <Leader>] <Esc>gt
