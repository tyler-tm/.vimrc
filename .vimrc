" Polyglot Ignore ----------------------------------------------------------
let g:polyglot_disabled = ['ts', 'js', 'tsx', 'jsx']

" Vim Plug -----------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/unite.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Keymappings --------------------------------------------------------------
let mapleader=" "                    " use space for leader
nnoremap <leader>c :noh<cr>          " clear search highlighting
nnoremap gV `[v`]                    " highlight last inserted text
nnoremap <C-J> <C-W>j                " easier window navigation
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-n> :NERDTreeToggle<CR>   " toggle NERDTree display

" Code Completion and Formatting -------------------------------------------
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" Theme --------------------------------------------------------------------
syntax enable
colorscheme space-vim-dark

" NERDTree -----------------------------------------------------------------
autocmd vimenter * NERDTree          " open NERDTree on startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
                                     " close Vim if tree is only tab left
augroup NERD                         " don't focus tree on open
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

" Airline ------------------------------------------------------------------
let g:airline_theme='base16'

" Text Display -------------------------------------------------------------
set showmatch                        " highlight matching paren/brace

" UI -----------------------------------------------------------------------
set number                           " display line numbers
set ruler                            " show current line and column number
set incsearch                        " incremental search as term is typed
set hlsearch                         " highlight all matches
set wildmenu                         " command menu autocomplete

" Tabs ---------------------------------------------------------------------
filetype plugin indent on            " indent based on current filetype
set expandtab                        " use spaces for tabs
set tabstop=2                        " use 4 spaces for tabs
set shiftwidth=2                     " use 4 spaces for indenting
set list
set listchars=tab:>--                " display all tabs as >--

" Other --------------------------------------------------------------------
set lazyredraw                       " prevent pointless screen redraws
