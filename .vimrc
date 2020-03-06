set nocompatible              " be iMproved, required

"
" OPTIONS
"
" filetype off                  " required
filetype plugin indent on       " automatically detect file types
syntax on
set timeoutlen=3000             " time in ms waiting for key mapping sequence to complete
set ttimeoutlen=100             " timeout on key codes after tenth of second
set history=1000                " store a ton of history
set nospell                     " spell checking off
set clipboard=unnamed           " set clipboard to MacOSX clipboard
set mouse=a                     " enable mouse to resize splits and change tabs
set winwidth=84                 " window width with multiple windows

"
" VIM UI
"
colorscheme Kafka
set showmode                                                                " display the current mode
" set colorcolumn=80                                                        " right margin indicator
set cursorline                                                              " highlight current line
hi cursorline ctermbg=237 term=bold cterm=bold                              " highlight bg color of current line
" hi CursorColumn ctermbg=1 cterm=bold guifg=white guibg=yellow gui=bold    " highlight cursor

"
" RELOAD CHANGES TO .vimrc
"
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

if has('cmdline_info')
    set ruler           " show the ruler
    "set rulerformat=%30(%=\\:b%n%y%m%r%w\\ %l,%c%V\\%P%) 
                        " a ruler on steroids
    set showcmd         " show partial commands in status line and
                        " selected characters/lines in visual mode
endif

"
" BASIC COMMANDS
"
set backspace=indent,eol,start	" allow backspace to join lines
set showmatch			        " show matching brackets/parentheses
set wildmenu			        " show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list, matches, then longest common part, then all
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap, too
set scrolljump=5		        " lines to scroll when cursor leaves screen
set scrolloff=3			        " minimum lines to keep above & below cursor

"
" SEARCH
"
set incsearch			        " find as you type search
set hlsearch			        " highlight search terms
set ignorecase			        " case insensitive search
set smartcase			        " case sensitive when UC present

"
" FORMATTING
"
set nowrap		    	                " don't wrap long lines
set matchpairs=(:),{:},[:],<:>,?:\:     " use % to go to matching {} <> []
set pastetoggle=<F12>                   " pastetoggle (sane indentation on pastes)
set tw=0                                " auto wrap at 79 chars
"set comments=sl:/\*,mb:\*,elx:\*/	    " auto format comment blocks

"
" TABS
"
set ai			    	                " indent at same level of prev line
set sw=4		    	                " use indents of 4 spaces
set tabstop=4			                " an indentation every four columns
set softtabstop=4		                " let backspace delete indent
set smarttab                            " helps with backspacing because of expandtab
set expandtab			                " tabs are spaces, not tabs

"
" HUD & STATUS INFO
"
set number		    	        " line numbers on
" set relativenumber              " let vim calculate the vertical jumps
" set numberwidth=5               " width of number column
set laststatus=2                " makes the status bar always visible
set ttyfast                     " improves redrawing for newer computers
set lazyredraw                  " will not redraw the screen while running macros (faster)

"
" SPLIT
"
set splitbelow
set splitright

"
" VIMTEX
"
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
autocmd BufNewFile,BufRead *.tex set iskeyword+=:

"
" TypeScript
"
au BufRead,BufNewFile *.ts setlocal filetype=typescript

"
" REMAPPINGS
"
noremap <F2> <Esc>:!pdflatex %:r && open %:r.pdf<CR>
inoremap <F2> <C-o>:!pdflatex %:r && open %:r.pdf<CR>
noremap <F3> <Esc>:!pdflatex %:r && bibtex %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf<CR>
inoremap <F3> <C-o>:!pdflatex %:r && bibtex %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf<CR>
noremap <F4> <Esc>:!pdflatex %:r && bibtex %:r && makeglossaries %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf<CR>
inoremap <F4> <C-o>:!pdflatex %:r && bibtex %:r && makeglossaries %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf<CR>
nnoremap <F5> "=strftime("%Y%m%d %H:%M:%S ")<CR>P
inoremap <F5> <C-R>=strftime("%Y%m%d %H:%M:%S ")<CR>
noremap <F6> <Esc>:!pdflatex %:r && bibtex %:r && makeglossaries %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf && pdflatex sf298<CR>
inoremap <F6> <C-o>:!pdflatex %:r && bibtex %:r && makeglossaries %:r && pdflatex %:r && pdflatex %:r && open %:r.pdf && pdeflatex sf298<CR>
noremap <F11> <Esc>:set nowrap<CR>
inoremap <F11> <C-o>:syntax sync fromstart<CR>

nnoremap <C-J> <C-W><C-J>
                        " Move down in split
nnoremap <C-K> <C-W><C-K>
                        " Move up in split
nnoremap <C-L> <C-W><C-L>
                        " Move right in split
nnoremap <C-H> <C-W><C-H>
                        " Move left in split
nnoremap H gT
nnoremap L gt
" nnoremap <NL> i<CR><ESC>
                        " insert line break in normal mode
"noremap + :s/^/\/\//<CR>    
                        " block comment
"noremap - :s/^\/\///<CR>
                        " uncomment

