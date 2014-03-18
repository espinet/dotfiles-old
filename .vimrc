set nocompatible " don't bother with vi compatibility

syntax enable " enable syntax highlighting

colorscheme molokai

" configure Vundle
set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set backupcopy=yes " see :help crontab
set backspace=2 " make backspace work normally in insert mode
set colorcolumn=100
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab
" set foldmethod=syntax " kind of folding applies in the current window
set foldlevelstart=1000
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline
set hidden " keep the changes to the buffer without writing them to the file
set history=1000
set hlsearch " highlight search terms
set ignorecase " case-insensitive search
set incsearch " search as you type
set laststatus=2 " always show statusline
set list " show trailing whitespace
set listchars=tab:▸\ ,eol:¬ " replace tab with arrow and eol with not
set mouse=a " enable basic mouse behavior such as resizing buffers.
set noerrorbells " no beep occurs when an error message is displayed
set noswapfile
set nowrap " turn of word-wrap
set number " display line numbers
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline
set scrolljump=5 " lines to scroll when cursor leaves screen
set showmatch
set shiftwidth=2 " show context above/below cursorline
set showcmd
set smartcase " ignore case if search is lower-case
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set splitbelow " Puts new split windows to the bottom of the current
set splitright " puts new vsplit windows to the right of the current
set t_Co=256
set tabstop=8 " actual tabs occupy 8 characters
set title " make xterm inherit the title from Vim
set undolevels=1000
set visualbell " use visual bell instead of beeping when doing something wrong
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full

if exists('$TMUX')  " support resizing in tmux
  set ttymouse=xterm2
endif

let mapleader = " "

if exists('$TMUX') " fix cursor in TMUX
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else " fix cursor in term
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd BufRead,BufNewFile *.fdoc set filetype=yaml " fdoc is yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown " md is markdown
autocmd BufRead,BufNewFile *.md set spell " add spell correction to markdown
autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" SHORTCUTS
" misc
nmap <silent><leader>cp :let @* = expand("%:p")<CR>
nmap <silent><C-l> :bnext<CR>
nmap <silent><C-h> :bprev<CR>
imap jk <Esc>
imap kj <Esc>

" nerdtree
nmap <F2> :NERDTreeToggle<CR>

" tagbar
nmap <F1> :TagbarToggle<CR>

" gitgutter
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk

" numbers

" SETTINGS
" gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_map_keys = 1
let g:gitgutter_highlight_lines = 0

" nerdtree
let g:NERDTreeWinSize = 34
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1

" tagbar
let g:tabular_loaded = 1
let g:tagbar_width = 34

" unite

" numbers
let g:enable_numbers = 1
let g:numbers_exclude = ['tagbar','nerdtree']

" ack
let g:ackprg = 'ag --nogroup --nocolor --column' " use ag instead of ack

" powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" functions
function! StripTrailingWhitespace()
  let lineNumber = line(".")
  %s/\ *$//g "\<CR>"
  let @/ = "" "\<CR>"
  exe ":" lineNumber
endfunction
