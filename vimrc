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
set gfn=Menlo:h14

" set 256 colors
set t_Co=256
set background=dark
colorscheme peaksea

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
set undodir=~/.vim/undodir
set undofile


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
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

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

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/jlmaccal/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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
" => Relative number
""""""""""""""""""""""""""""""
map <leader>rn :RltvNmbr<CR>
map <leader>rN :RltvNmbr!<CR>

