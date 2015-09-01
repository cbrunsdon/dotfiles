set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'rking/ag.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'

Plugin 'thoughtbot/vim-rspec'
Plugin 'adammathys/vim-dispatch'

call vundle#end()
filetype plugin indent on

set noswapfile

filetype plugin indent on     " required!
au BufNewFile,BufRead *.ejs set filetype=html

set expandtab
set shiftwidth=2
set tabstop=2

" need 256 colors for inkpot
set t_Co=256
color inkpot

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" warning @ 81st char
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set wildignore+=*/tmp/*,*/.git/*,*/vendor/bundle/*,*/build/*

" RSpec + Dispatch!
let g:rspec_command = 'Dispatch rspec {spec}'

"Dispatch compilers
let g:dispatch_compilers = { 'rspec-fast' : 'rspec' }

let mapleader = ","

map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :Dispatch rspec-fast<CR>

" Edit file in the same path
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

syntax on
