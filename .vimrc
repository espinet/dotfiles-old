" SETUP
"   Link dotfiles
"     ln -s /vim/.vim .vim
"     ln -s /vim/.vimrc .vimrc
"   Tagbar
"     brew install ctags
"   JSHint
"     brew install node
"     sudo npm install -g jshint
"     ln -s /jshintrc .jshintrc
"   Vundle
"     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"     vim +BundleInstall +qall


" TODO
" Setup Unite for
"   open buffers
"   filename search
"   file content search
"   register search
" Split .vimrc into multiple files


" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
" From GitHub scripts: Bundle 'Lokaltog/vim-easymotion'
" From http://vim-scripts.org/vim/scripts.html: Bundle 'FuzzyFinder'
" Not on GitHub: Bundle 'git://git.wincent.com/command-t.git'
" Local machine: Bundle 'file:///home/gmarik/path/to/plugin'
Bundle 'gmarik/vundle'

Bundle 'xolox/vim-misc'

Bundle 'tomasr/molokai'
Bundle 'myusuf3/numbers.vim'
Bundle 'plasticboy/vim-markdown'

Bundle 'scrooloose/syntastic'
Bundle 'walm/jshint.vim'
Bundle 'Shutnik/jshint2.vim'

Bundle 'tristen/vim-sparkup'
Bundle 'tpope/vim-surround'
" Look into snippets, https://github.com/spf13/snipmate-snippets
Bundle 'msanders/snipmate.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'kchmck/vim-coffee-script'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'Shougo/unite.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'airblade/vim-gitgutter'

Bundle 'ivalkeen/vim-simpledb'

filetype plugin indent on

" Theme
set guifont=Monaco:h10
colorscheme molokai
set colorcolumn=79

" Git settings
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

syntax enable " Syntax highlighting

" Replace tab with arrow and eol with not
set list
set listchars=tab:▸\ ,eol:¬

set foldmethod=indent
set foldlevelstart=20

" Pipe cursor for insert mode in vi.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Reload file when updated.
set autoread

" ---------- KEY BINDINGS ----------
let mapleader = " "

set mouse=a

" Navigation
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_t = ''
let g:EasyMotion_mapping_T = ''
nmap <F1> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
let g:tagbar_width = 34
let g:NERDTreeWinSize = 34
let g:NERDTreeWinPos = "right"

" Unite config
noremap <leader>t :Unite -start-insert file<Enter>

" Buffer cycling
map <C-l> :bnext<CR>
map <C-h> :bprev<CR>

" Copy currenty filepath to clipboard
nmap <leader>cp :let @* = expand("%:p")<CR>

" Delete trailing whitespace
function! ClearTrailingSpace()
  let lineNumber = line(".")
  %s/\ *$//g "\<CR>"
  let @/ = "" "\<CR>"
  exe ":" lineNumber
endfunction
nmap <leader>ds :call ClearTrailingSpace()<CR>

" ---------- OTHER ----------
set backspace=2               " Make backspace work normally in insert mode
set smartcase                 " Ignore case if search is lower-case
set hlsearch                  " Highlight search terms
set incsearch                 " Show search matches as you type
set tabstop=2                 " Add to space tabs
set nowrap                    " Turn of word-wrap
set shiftwidth=2
set expandtab
set autoindent
set history=1000
set undolevels=1000
set wildignore=*.swp
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set hidden                   " Allow buffer switching without saving file
