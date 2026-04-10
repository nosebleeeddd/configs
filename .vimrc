" V imPROVED
" Copy and paste to .vimrc in home dir


set nocompatible

let mapleader = " "
" Open dir explorer in new tab
nnoremap <leader>cd :Ex<CR>
" Delete current buffer
nnoremap <leader>q :bdelete<CR>
" Next buffer
nnoremap <leader>n :bnext<CR>
" Previous buffer
nnoremap <leader>p :bprevious<CR>

" Sets the line numbers
set number relativenumber
set hlsearch
set incsearch

" sets our tab size to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" converts our tabs to spaces
set expandtab
set autoindent
set smartindent
set fileformat=unix

" sudo apt-get install vim-gtk3 FOR CLIPBOARD COPY
" for clipboard copy
set clipboard=unnamedplus

" ColorScheme
colorscheme zaibatsu
set t_Co=256

" Encoding
set encoding=utf-8

" autocompeletion CTRL + n to activate:
set wildmode=longest,list,full

" syntax highlighting
syntax on

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Leave insert mode with jk
inoremap jk <Esc>

" Newtab
nnoremap <silent> <C-t> :tabnew<CR>

" Paste from system clipboard with ctrl+i instead of shift insert
map <S-Insert> <C-i>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e


