set nocompatible " be iMproved
filetype off " required

" Vundle setup
" required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
"Plugin 'pangloss/vim-javascript'

" My Bundles here:
"
" File and Tree navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' "git flags in NERDTree
Plugin 'bling/vim-airline' "status/tabline custom
Plugin 'tpope/vim-fugitive' "git plugin
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'othree/html5.vim'


"Go programming plugin
Plugin 'fatih/vim-go'


Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-abolish'

" Optional:
Plugin 'honza/vim-snippets'

" original repos on github
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'Lokaltog/vim-powerline'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Plugin 'mattn/emmet-vim'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"remap leader key to comma
let mapleader = ","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"hidden buffers
set hidden
set confirm


set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set copyindent
set number
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set smartindent
set nohlsearch
set incsearch

set scrolloff=5

set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells

"disabling backup and swapfile
set nobackup
set noswapfile

"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

syntax enable
set mouse=a
set encoding=utf-8

"setting color stuff
colorscheme default

" Plugin configurations

"NERDTreee configuration

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFocus<cr>
map <leader>ni :NERDTreeFind<cr>

"Airline Configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_c='%t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'

"CtrlP No index for the vendor, cache, ...
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/cache/*,*/*.o

"CtrlP Set cache in cache folder
let g:ctrlp_cache_dir = $HOME . '/tmp/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Create directory if path does not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
autocmd BufNewFile,BufRead *.html.twig   set syntax=htmldjango
autocmd BufNewFile,BufRead *.cl set syntax=c
autocmd BufNewFile,BufRead *.vert set syntax=c
autocmd BufNewFile,BufRead *.frag set syntax=c
set backspace=2
set ttymouse=sgr
noremap <F8> :call HexMe()<CR>

let $in_hex=0
function HexMe()
	set binary
	set noeol
	if $in_hex>0
		:%!xxd -r
		let $in_hex=0
	else
		:%!xxd
		let $in_hex=1
	endif
endfunction

