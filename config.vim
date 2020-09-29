set encoding=utf-8

" line numbers
set relativenumber
set number

" Search
set incsearch
set hlsearch
set showmatch
set smartcase
set shortmess-=S

" Indentation
set autoindent
set smartindent

" Fix backspace fistunim
set backspace=indent,eol,start

" Bottom line
set ruler
set showcmd
set statusline=2
set showmode

" Line length
set wrap
set colorcolumn=100

" Shift
set shiftwidth=4
set tabstop=4
set softtabstop=-1
set expandtab
set shiftround

" Misc
set ttyfast
set matchpairs+=<:>

" Colors
set t_Co=256
set background=dark
colorscheme gruvbox
syntax on

" No annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all

" Initialize ctags in the background and cscope when opening and saving a file
" You must put a 'tags' file in the root dir of the projects,
" and always open files from the root directory.
let ctags_init_command = "test -f tags && ctags -R --c-kinds=+defgpstux -o newtags && mv newtags tags&"
let cscope_init_command = "test -f tags && cscope -Rbq"
autocmd BufWritePost * call system(ctags_init_command)
autocmd BufWritePost * call system(cscope_init_command) | cscope reset
autocmd BufReadPre,FileReadPre * call system(ctags_init_command)
autocmd BufReadPre,FileReadPre * call system(cscope_init_command) | cscope reset
if filereadable("cscope.out")
    cscope add cscope.out
endif

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * highlight clear ExtraWhitespace
autocmd InsertLeave * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Fold only functions in C files.
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType c set foldnestmax=1

" Makes Ctrl-Left and Ctrl-Right jump between words in command mode.
execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"

