execute pathogen#infect()

let g:CommandTMaxFiles=50000
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTTraverseSCM = 'pwd'


"PowerLine related stuff
" let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h14

" ««««««  Set colorscheme related stuff »»»»»»
"=============================================

set t_Co=16
colorscheme onedark
let g:onedark_termcolors=16
let g:airline_theme='onedark'
set background=dark

set colorcolumn=80

set backspace=indent,eol,start

autocmd BufNewFile *.html :r ~/.templates/HTML.html

" Syntastic Stuff
"=======================

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['standard']

"Competitive Programming
"=======================

iabbrev MSB 
			\<Esc>:r ~/.templates/MSB<CR>

iabbrev LSB 
			\<Esc>:r ~/.templates/LSB<CR>

iabbrev GOSPERSHACK 
			\<Esc>:r ~/.templates/GosperHack<CR>

iabbrev LIS 
			\<Esc>:r ~/.templates/LIS<CR>

iabbrev BRIDGETREE 
			\<Esc>:r ~/.templates/BridgeTree<CR>

iabbrev CONVEXHULLTRICK 
			\<Esc>:r ~/.templates/ConvexHullTrick.cc<CR>

iabbrev LOWESTPRIMES 
			\<Esc>:r ~/.templates/LowestPrimes<CR>

iabbrev UNIONFIND 
			\<Esc>:r ~/.templates/UnionFind<CR>

iabbrev FACTORIAL 
			\<Esc>:r ~/.templates/Factorial<CR>

iabbrev DINIC 
			\<Esc>:r ~/.templates/Dinic<CR>

iabbrev SEGTREE 
			\<Esc>:r ~/.templates/SegTree<CR>

iabbrev LOWESTCA 
			\<Esc>:r ~/.templates/LCA<CR>

iabbrev PHIRANGE 
			\<Esc>:r ~/.templates/PhiRange<CR>

iabbrev SQUAREROOTTRICK 
			\<Esc>:r ~/.templates/SquareRootTrick<CR>

iabbrev TEMPLATE1 
			\<Esc>:r ~/.template.cc<CR>

iabbrev TEMPLATE2 
			\<Esc>:r ~/.template2.cc<CR>

iabbrev HEAVYLIGHT 
			\<Esc>:r ~/.templates/HeavyLight<CR>

iabbrev FINDCYCLE 
			\<Esc>:r ~/.templates/FindCycle<CR>

iabbrev TOPSORT 
			\<Esc>:r ~/.templates/TopSort<CR>

iabbrev FastFT 
			\<Esc>:r ~/.templates/FFT<CR>

iabbrev BRIDGE 
			\<Esc>:r ~/.templates/Bridge<CR>

iabbrev ArticulationPOINTS 
			\<Esc>:r ~/.templates/ArticulationPoints<CR>

iabbrev STIRLINGSECOND 
			\<Esc>:r ~/.templates/StirlingSecond<CR>

iabbrev BELL 
			\<Esc>:r ~/.templates/Bell<CR>

iabbrev NCR 
			\<Esc>:r ~/.templates/nCr<CR>

iabbrev TOSTRING 
			\<Esc>:r ~/.templates/ToString<CR>

iabbrev MATRIXMULTIPLICATION 
			\<Esc>:r ~/.templates/MatrixMultiplication<CR>

iabbrev KOSARAJU 
			\<Esc>:r ~/.templates/Kosaraju<CR>

iabbrev PRIMESIEVE 
			\<Esc>:r ~/.templates/SieveEratosthenes<CR>

iabbrev DIJKSTRA 
			\<Esc>:r ~/.templates/Dijkstra<CR>

iabbrev CATALAN 
			\<Esc>:r ~/.templates/Catalan<CR>
"Use tab for auto-complete
"=========================
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

"Use j and k to traverse through auto-complete suggestions
"=========================================================
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

"Compiling c++ in one click
"======================

set makeprg=g++\ -o\ \"%:p:r\"\ \"%:p\"
map <F9> :w<CR>:!clear<CR>:make<CR>
inoremap <F9> <ESC>:w<CR>:!clear<CR>:make<CR>
map <F5> :!clear<CR>:!%:p:r<CR>

"Beta mode mapping
"==================

inoremap {<CR> {<CR>  <CR>}<up><right>

" ««««««  Toggle color scheme using a mapping  »»»»»»
"====================================================

function! BgToggleSol()
	if &background == "light"
		execute ":set background=dark"
	else
		execute ":set background=light"
	endif
endfunction

nnoremap qwer :call BgToggleSol()<cr>

" ««««««  Paste in insert mode without having to worry about set paste  »»»»»»
"=============================================================================

if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" ««««««  Leader  »»»»»»
"=======================

let mapleader=","

" ««««««  Spell check stuff  »»»»»»
"==================================

" Turn ON only for text files, change text to *
" If you want it ON for all file types

autocmd FileType text set spell spelllang=en_us

" ««««««  Standard Javascript »»»»»»
"==================================

autocmd FileType javascript set tabstop=2
autocmd FileType javascript set expandtab
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript retab

nnoremap <leader>sp :call FixLastSpellingError()<cr>

"Function to wrap things up
function! FixLastSpellingError()
	normal! mm[s1z=`m
endfunction

" ««««««  Awesome and Non Conventional Mappings  »»»»»»
"======================================================

"Ditch Relative line numbers.. To jump to say x-th line.. in normal mode do:
"		»» 	123<cr>
nnoremap <cr> G

"Switch between split panes in normal mode using Backspace
nnoremap <bs> <c-w>W
nnoremap <Tab> <c-w>w

"Type asd in insert mode to go to normal mode.. 
inoremap asd <Esc>	

"Center in on the line where the search element is found
" nnoremap N Nzz						

"Same
" nnoremap n nzz						

"Open vimrc in a split to quickly make changes
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"Source vimrc quickly
noremap <leader>sv :source $MYVIMRC<cr>

"Quote the selected WORD
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" ««««««  Movement Mappings  »»»»»»
"==================================

"Doing stuff inside parentheses
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>

" ««««««  Basic Stuff  »»»»»»
"============================

set encoding=utf8
set visualbell
syntax enable
filetype plugin indent on
filetype on
set nocompatible

"For windows users. Doesn't do anything for others
set clipboard=unnamed

" ««««««  Abbreviations  »»»»»»
"==============================

" ««««««  SETTERS  »»»»»»
"========================

"Cursor Lines are good especially with solarized
set cursorline

"Say no to swap files
set noswapfile
set nobackup
set nowb

"This is just awesome, Scroll starts when cursor is 8 lines away from top/bottom
set scrolloff=8

"Set fast cursor
set ttyfast

"Show commands
set showcmd

"Display the status line always
set laststatus=2

"Setting tab to 2 spaces
set tabstop=4
set shiftwidth=4

"Indentation stuff
set smarttab
set autoindent
set smartindent

"Paste mode can be enabled using F2
set pastetoggle=<F2>

"Line numbers ought to be there
set ruler
set relativenumber
set number

"Incremental search is good
set incsearch

"Highlight search elements
set hlsearch
set title

"Unmap the arrow keys
nnoremap <up> ddkP
nnoremap <down> ddp

"	««««««		Custom Mappings(Harmless)			»»»»»»
"===========================================

"general mappings
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-S-Tab> <ESC> :tabprevious<CR>
imap <C-Tab> <ESC> :tabnext<CR>
noremap <F7> :set expandtab!<CR>

"Rarely used stuff
nmap gO O<ESC>j

" Vim Airline Customization
"==========================

function! MyOverride()
	let keys = ['b','k','2','d','c','r','a','d', 'l', 'e']
	for k in keys
		call airline#parts#define_text(k, k)
	endfor
	call airline#parts#define_accent('a', 'yellow')
	call airline#parts#define_accent('b', 'yellow')
	call airline#parts#define_accent('c', 'yellow')
	call airline#parts#define_accent('d', 'yellow')
	call airline#parts#define_accent('e', 'yellow')
	call airline#parts#define_accent('r', 'yellow')
	call airline#parts#define_accent('2', 'yellow')
	call airline#parts#define_accent('k', 'yellow')
	call airline#parts#define_accent('l', 'yellow')
	let g:airline_section_a = airline#section#create(keys)
	let g:airline_section_y = '%b'
endfunction
" autocmd VimEnter * call MyOverride()
