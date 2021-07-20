" -------
" PLUGINS
" -------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround' "operations on surrounding things
Plug 'tpope/vim-repeat' "repeat some non-built-in commands
Plug 'svermeulen/vim-cutlass' "easier clipboard behavior
Plug 'tpope/vim-fugitive' "git functionality
Plug 'freitass/todo.txt-vim' 
Plug 'mattn/emmet-vim'
Plug 'ackyshake/VimCompletesMe'
Plug 'takac/vim-hardtime'
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

" -------
" GENERAL
" -------

" Enforce learning
let g:hardtime_default_on = 1
let g:hardtime_timeout = 500
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2
let g:list_of_normal_keys = ["h", "j", "k", "l", "w", "b", "e"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "w", "b", "e"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

set encoding=utf-8

" syntax highlighting, indentation
filetype plugin indent on
syntax on
set number relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" Ensures word-wrap does not split words
set formatoptions=croq
set linebreak breakindent
set textwidth=72
set colorcolumn=+1

" better search
set incsearch ignorecase smartcase hlsearch

" file related things
set autoread
set viminfo=""
set noswapfile
set hidden

" file browser
let g:netrw_banner = 0

" use system clipboard
" requires xclip and vim compiled with clipboard support
set clipboard=unnamed,unnamedplus 

" keyboard mappings for cutting, because of vim-cutlass
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" theme
colorscheme dim

" displaying text
set scrolloff=5 
set sidescroll=1 sidescrolloff=10
set display=lastline

" completion menu
set completeopt=longest,menuone
set shortmess+=c
set wildmenu

" spell checking
set spelllang=en_us,hu

" status line
set laststatus=2

" Load Emmet only in html and css
let g:user_emmet_install_global = 0

" ---
" MAPPINGS
" --------

let mapleader = " "

nnoremap <silent> <leader>s :setlocal spell!<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>

" nnoremap <silent> <leader>m :make %<CR>
nnoremap <silent> <leader>m :silent make % <bar> cwindow <bar> cfirst <bar> redraw! <cr>
nnoremap <leader>b :ls<cr>:buffer 

nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" allow saving of files as sudo when I forgot to start vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


" -------------
" AUTO COMMANDS
" -------------

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead *.{md,txt} setlocal formatoptions=tn1
    autocmd FileType sh compiler shellcheck
    autocmd FileType python compiler pylint
    autocmd FileType html,css EmmetInstall
augroup end
