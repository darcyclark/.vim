call pathogen#infect() 
let mapleader = ","

" tasklist
map <leader>y <Plug>TaskList

" enable autocomplete - Neocompletecache
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

" sessions
set sessionoptions=blank,buffers,curdir
map <F9><F9> :mksession! ~/.vimsession <cr>
map <F9> :source ~/.vimsession <cr>

" tweak directions keys to be more intuitive (to me)
noremap j <Up>
noremap k <Down>
noremap R :redo<CR>

" useful find-and-replace shortcuts
" current word
map <F4> :%s/<C-r><C-w>//gc<Left><Left><Left>
" current word - visual mode
vmap <F4> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>

" clear search highlighting
nmap <silent> ,/ :let @/=""<CR>

" insert blank line in normal mode
noremap <leader>j :put!=''<CR>
noremap <leader>k :put=''<CR>

" change escape
inoremap ;; <Esc>

" easier saving
inoremap \\ <C-O>:w<CR>
noremap \\ :w<CR>

"set clipboard=unnamed
set selection=inclusive
set keymodel=startsel
set mousemodel=popup
set selectmode=mouse,key

let &t_Co=16

" colors and fonts
colorscheme lucius
LuciusDarkLowContrast
set guifont=Consolas\ 10
set gfn=Consolas
if has("gui_running")
    set lines=45 columns=120
endif

syntax on
filetype plugin indent on " turn on the indent plugins
set pastetoggle=<F11>
set nobackup
set nowritebackup
set noswapfile
" set autochdir " always switch to the current file directory"
set cursorline
set mouse= " disable mouse handling in vim
set hidden " you can change buffers without saving
set nocompatible " use vim defaults
set ls=2 " always show status line
set shiftwidth=2 " number of spaces to (auto) indent
set scrolloff=3 " keep 3 lines when scrolling
set showcmd " display incomplete commands
set showmode " display the current mode
set hlsearch " highlight searches
set incsearch " do incremental search
set ruler " show the cursor position all the time
set laststatus=2
set visualbell " turn off error beep/flash
set number " show line numbers
set numberwidth=4 " line numbering takes up to 4 spaces
set ignorecase "ignore case when searching
set linebreak " linebreaks
set nowrap " stop lines from wrapping
set title " show title in the console title bar
set ttyfast " smoother changes
set bs=2 " backspace can delete previos characters
set backspace=indent,eol,start " more backspace settings
set modeline " last lines in document sets vim mode
set modelines=3 " number of lines checked for modelines
set shortmess=atI " abbreviate messages
set nostartofline " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,] " move freely between files
set undolevels=200
set cpoptions=$cF
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ [TYPE=%Y\ %{&ff}]\ \ CWD:\ %r%{CurDir()}%h\ \ Line:\ %l/%L:%c
function! CurDir()
   let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
   return curdir
endfunction
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set sm " show matching braces

" Tabs 
set tabstop=2 " number of spaces for tab character
set expandtab " tabs are converted to spaces

" Searching
map <F5> :Ack 
map <F5><F5> :Ack <cword><CR>
map <F10><F10> :ccl<CR>
map <F10> :copen<CR>

" ctrlp.vim
silent! nmap <unique> <silent> <Leader>pp :CtrlP CWD<CR>

" NERD_tree config
map <F1> :NERDTreeToggle<CR>
map <F1><F1> :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyd$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeQuitOnOpen=1
 
" TagList Plugin Configuration
" let Tlist_Ctags_Cmd='/usr/bin/ctags' " point taglist to ctags
map <F3> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" various keymaps
map <silent> <F2> :TSelectBuffer<CR> 
map <F2><F2> :MRU<CR>   " Most recently opened files

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
map <F6> :SyntasticCheck<CR>
map <F6><F6> :SyntasticToggle<CR>
map <F6><F6><F6> :SyntasticInfo<CR>

map <leader>ww :set wrap linebreak textwidth=0<CR> " turn on wrapping
map <leader>h :cd %:h<CR> " change current directory context to that of current file
map <leader>p :pwd<CR> " print current directory context
map <leader>o :on<CR> " make current window only window

" Special handling for some file formats
au BufNewFile,BufRead *.dtml set ft=html
au BufNewFile,BufRead *.css.dtml set ft=css
au BufNewFile,BufRead *.pt set ft=html
au BufNewFile,BufRead *.ftl set ft=html
au BufNewFile,BufRead *.cpt set ft=html
au BufNewFile,BufRead *.cpy set ft=python
au BufNewFile,BufRead *.vpy set ft=python
au BufNewFile,BufRead *.html set ft=html
au BufNewFile,BufRead *.groovy setf groovy

" code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 

" splits 
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" Padrino
map <leader>rc :Rcontroller<CR>
map <leader>rr {)2w
map <leader>rv {)2w:Rview <cword><CR>
map <leader>rm :Rmodel<CR>
