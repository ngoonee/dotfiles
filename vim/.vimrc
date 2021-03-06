"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()
"call pathogen#helptags()
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupdir=$HOME/.vim "
set dir=$HOME/.vim
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase  " searches are case-insensitive
set smartcase  " as long as one character is different - case-sensitive search

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
  colorscheme jellybeans
endif

if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  set autoindent		" always set autoindenting on
endif " has("autocmd")

if has("spell")
  " turn spelling on by default
  "set spell

  " toggle spelling with F4 key
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " limit it to just the top 10 items
  set sps=best,10                    
endif

" Set the wildmenu options for completion in the command line
set wildchar=<Tab> wildmenu wildmode=full
" Colors for background of wildmenu
highlight StatusLine ctermbg=16 ctermfg=255
" Colors for actual current wildmenu selection
highlight WildMenu ctermbg=19
" wildchar for the menu - <Leader>b shows open tabs and allows selection
set wildcharm=<C-z>
nnoremap <Leader>b :buffer <C-z><S-Tab>

" Fix for utf-8 content
set enc=utf-8
set fileencoding=utf-8

" latexsuite related
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_MultipleCompileFormats='pdf, dvi'
let g:Tex_DefaultTargetFormat='pdf'

" General
set nu " numbered lines on left
set expandtab " tabs converted to spaces
set tabstop=4 " default space of a tab
set shiftwidth=4 "default indentation spaces
set textwidth=100
" Formatting options ignore textwidth, instead just highlight whatever the
" excess is. o is so that o/O within comments adds comments tag. r is so that
" hitting 'enter' continues a comment
set fo+=qotcr
highlight Excess ctermbg=DarkGray guibg=Black
match Excess /\%100v.*/
" Use freedesktop.org clipboard rather than xorg clipboard
set clipboard=unnamedplus

" Always show status line
set guifont=Inconsolata\ for\ Powerline\ 11
set laststatus=2
"
" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen

" Enable neocomplete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_auto_select = 1

" Options for python
augroup python_autocmds
    autocmd!
    au FileType python set fo-=tc
    "au FileType python setlocal omnifunc=pythoncomplete#Complete
    "au FileType python setlocal omnifunc=jedi#completions
    "let g:jedi#completions_enabled = 0
    "let g:jedi#auto_vim_configuration = 0
    "let g:jedi#smart_auto_mappings = 1
    "if !exists('g:neocomplete#force_omni_input_patterns')
        "let g:neocomplete#force_omni_input_patterns = {}
    "endif
    "let g:neocomplete#force_omni_input_patterns.python =  '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    "let g:neocomplete#force_omni_input_patterns.python =  '\h\w*\|[^. \t]\.\w*'
    au FileType python highlight Excess ctermbg=DarkGray guibg=Black
    au FileType python match Excess /\%80v.*/
    au FileType python set nowrap
    set foldmethod=indent foldlevelstart=99
augroup END

" Options for vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_paste_file = "/tmp/.slime_paste"

" Gundo options (undo tree)
let g:gundo_prefer_python3 = 1
nnoremap <F6> :GundoToggle<CR>

" Enable undo persistence
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number of lines to save for undo on a buffer reload

" Disable undo persistance for certain files
au BufWritePre /tmp/* setlocal noundofile

" Enable opening new buffer without saving the old one
set hidden

" Beancount alignment marker
let g:beancount_separator_col=66

let g:ycm_path_to_python_interpreter = '/usr/bin/python'
