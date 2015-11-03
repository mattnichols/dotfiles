set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'
Bundle 'morhetz/gruvbox'

" Fuzzy finder -- absolutely must have.
Bundle 'kien/ctrlp.vim'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'

" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Bundle 'groenewege/vim-less'

" Coffee-script syntax.
Bundle 'kchmck/vim-coffee-script'

" Vim Rails
Bundle 'tpope/vim-rails'

" Vim Fugitive for Easily doing git things within vim
" Examples:
" :Git status
" :Git push origin master
" :Git add .
Bundle 'tpope/vim-fugitive'

" Syntax highlighting for Ruby and easy navigation
" Examples:
" ]m # to edit start of next method definition
" ]M # to go to end of next method definition
" [m # to start of previous method definition
" [M # to end of previous method defenition
Bundle 'vim-ruby/vim-ruby'

" Provide Bundle from vim
" :Bundle
" :Bopen #opens Gemfile
Bundle 'tpope/vim-bundler'

" Provide Rake from vim
" :Rake
Bundle 'tpope/vim-rake'

" Run your ruby tests `:help vroom`
Bundle 'skalnik/vim-vroom'

" Cobalt Color Scheme
" Bundle 'herrbischoff/cobalt2.vim'

" Elixir highlighting in vim
Plugin 'elixir-lang/vim-elixir'

" Nerdtree
Plugin 'scrooloose/nerdtree.git'

" Plugin 'flazz/vim-colorschemes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set backspace=2 " so mac delete works like backspace in insert
set t_Co=256 " 256 colors setting

" Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim

set nu " line numbers on
set showmatch

set hls " Set highlight search

set nowrap " don't wrap text
set ruler

set listchars=tab:▸\ ,eol:¬

" Tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent

syntax enable
"let g:gruvbox_italic=0
"let g:gruvbox_termcolors=16
colorscheme cobalt

" Always open NERDTree by default
autocmd VimEnter * wincmd p
" Do not open nerdtree if gitcommit
" autocmd VimEnter * if &filetype !=# 'gitcommit' && &filetype !=# 'git-rebase-todo' | NERDTree  | wincmd p | endif
" let NERDTreeShowHidden=1

" Allow vim to jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" discolor after 80 chars
" let &colorcolumn=join(range(81,999),",")

" Use ag(silver searcher) with ctrlp and vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
