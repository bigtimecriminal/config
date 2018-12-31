set number
set autoindent
set copyindent
set tabstop=2
set sw=2
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

" per project vimrc
set exrc
set secure

" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
 
let g:airline_powerline_fonts = 1

" http://vimcasts.org/episodes/neovim-terminal-mappings/
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

if has('nvim')
  func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
      stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
      \ "<C-\\><C-n>"
      \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
      \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
  endfunc
  for dir in ["h", "j", "l", "k"]
      call s:mapMoveToWindowInDirection(dir)
  endfor
endif

" Remap Leader to comma, easy to reach
let mapleader=","

" Quickly change from tab to tab
tnoremap <Leader>[ <C-\><C-n>gT
tnoremap <Leader>] <C-\><C-n>gt
noremap <Leader>[ gT
noremap <Leader>] gt
inoremap <Leader>[ <Esc>gT
inoremap <Leader>] <Esc>gt

" Quickly create a new terminal in a new tab
tnoremap <Leader>c <C-\><C-n>:tab new<CR>:term<CR>
noremap <Leader>c :tab new<CR>:term<CR>
inoremap <Leader>c <Esc>:tab new<CR>:term<CR>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>
noremap <Leader>% :vsp<CR><C-w><C-w>:term<CR>
inoremap <Leader>% <Esc>:vsp<CR><C-w><C-w>:term<CR>

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>" <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>
noremap <Leader>" :sp<CR><C-w><C-w>:term<CR>
inoremap <Leader>" <Esc>:sp<CR><C-w><C-w>:term<CR>
