filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


""""""""""""""""""""""""""""""""""""
" General Setup
""""""""""""""""""""""""""""""""""""
" set how many lines of history vim remembers
set history=700

" enable filetype plugin
filetype plugin on
filetype indent on

" set to autoread a file when it is changed from the outside
set autoread

" map the leader to comma instead of backslash
let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

" set the shell
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""
" vim user interface settings
""""""""""""""""""""""""""""""""""""
" set 7 lines to the cursors when moving vertically
set so=7

" turn on wild menu
set wildmode=longest:full
set wildmenu

" always show the current position
set ruler

" the command bar height
set cmdheight=2

" change buffers without saving
set hid

" set backspace configuration
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase
set smartcase

" highlight search
set hlsearch

" turn on incremental search
set incsearch

" don't redraw while running macros
set nolazyredraw

" set pattern matching to magic and hack to always set very magic when searching
set magic
nnoremap / /\v
nnoremap ? ?\v

" show matching braces for 0.2 seconds
set showmatch
set mat=2

" no sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""
" enable syntax hl
syntax enable

" Set font
set gfn=Menlo:h14

" set 256 colors
set t_Co=256
set background=dark
colorscheme ir_black
