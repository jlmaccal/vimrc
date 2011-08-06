set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'hallison/vim-markdown'
Bundle 'olivierverdier/vim-latex-box'
Bundle 'sjbach/lusty'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Obvious-Mode'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'wincent/Command-T'
Bundle 'sjl/gundo.vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-unimpaired'
Bundle 'int3/vim-extradite'
Bundle 'adrianolaru/vim-mustang.git'
Bundle 'vim-scripts/desert256.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'dickeytk/status.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chrismetcalf/vim-yankring'


filetype plugin indent on     " required! 

"
" Brief help
"
" :BundleInstall  - install bundles (won't update installed)
" :BundleInstall! - update if installed
"
" :Bundles foo    - search for foo
" :Bundles! foo   - refresh cached list and search for foo
"
" :BundleClean    - confirm removal of unused bundles
" :BundleClean!   - remove without confirmation
"
" see :h vundle for more details
" or wiki for FAQ
" Note: comments after Bundle command are not allowed..



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

" set the shell
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""
" vim user interface settings
""""""""""""""""""""""""""""""""""""
" set 5 lines/chars when scrolling
set scrolloff=5
set sidescrolloff=5

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
" use ,/ to hide the highlighting
nnoremap <silent> <leader>/ :nohlsearch<Bar>:echo<CR>

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
"set noerrorbells
set visualbell
"set t_vb=
"set tm=500

" turn on line numbering
set number


""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""
" enable syntax hl
syntax enable

" Set font
if has("macunix")
    set gfn=Menlo:h16
endif

" set 256 colors
set t_Co=256
set background=dark
colorscheme solarized


set encoding=utf8
try
	lang en_US
catch
endtry

" default filetypes
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""
" Files backup and undo
""""""""""""""""""""""""""""""""""""
" turn off backups since we're usually using git anyway
set nobackup
set nowb
set noswapfile

" turn on persistent undo
if version >= 703
    set undodir=~/.vim/undodir
    set undofile
endif


""""""""""""""""""""""""""""""""""""
" Text, tab, and indent related
""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

" auto indent
set ai

" smart indent
set si


""""""""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""""""""
" In visual mode press * or # to match current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" make shifts keep visual selection
vnoremap < <gv
vnoremap > >gv

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
map <leader>bd :Bclose<cr>
map <leader>bw :bw<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>co :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,s will toggle and untoggle spell checking
map <leader>s :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1


""""""""""""""""""""""""""""""
" => key mappings
""""""""""""""""""""""""""""""
" set jj to be <esc>
inoremap jj <esc>
cnoremap jj <c-c>

" ,v brings up vimrc file
nmap <leader>v :e ~/.vim/vimrc<CR>
" ,V reloads vimrc file
nmap <silent> <leader>V :source ~/.vim/vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" quick add newline with <CR>
nmap <CR> o<esc>

" show registers with ,r
nmap <leader>r :register<CR>

" paste from numbered register with ,<number>
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p

" moving between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

iab <expr> ddate strftime("## %a %d %b %Y")

" vim-task
noremap <silent> <buffer> T :call Toggle_task_status()<CR>
inoremap <silent> <buffer> <C-T> <ESC>:call Toggle_task_status()<CR>i

" supertab
set completeopt=menuone,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

" Tagbar
" Hotkey
nnoremap <silent> <leader>tt :TagbarToggle<CR>
" Put tagbar on the left
let g:tagbar_left = 1
" Tagbar auto gets focus
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" Gundo hotkey
nnoremap <leader>uu :GundoToggle<CR>

" NERDTree hotkey
nnoremap <leader>nn :NERDTreeToggle<CR>

" Setup viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" NERDTree auto closes
let g:NERDTreeQuitOnOpen = 1

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>m'

" Statusline
let g:statusline_rvm = 0
let g:statusline_enabled = 1
let g:statusline_fullpath = 1

" YankRing
nnoremap <silent> <leader>yy :YRShow<CR>

