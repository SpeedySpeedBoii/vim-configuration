" Encoding {{{
set encoding=utf-8
"}}}

" line numbers {{{
set relativenumber
set number
" }}}

" Search {{{
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set shortmess-=S
" }}}

" Indentation {{{
set autoindent
set smartindent
set cinoptions+=(0
" }}}

" Fix backspace {{{
set backspace=indent,eol,start
" }}}

" Bottom line {{{
set ruler
set showcmd
set statusline=2
set showmode
" }}}

" Line length {{{
set wrap
set colorcolumn=100
" }}}

" Shift {{{
set shiftwidth=4
set tabstop=4
set softtabstop=-1
set expandtab
set shiftround
" }}}

" Misc {{{
set ttyfast
set matchpairs+=<:>
" }}}

" Colors {{{
set t_Co=256
set background=dark
colorscheme gruvbox
syntax on
" }}}

" No annoying sounds {{{
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all
" }}}

" Highlight trailing spaces {{{
highlight ExtraWhitespace ctermbg=red guibg=red
augroup highlight_trailing_spaces
    autocmd InsertEnter * highlight clear ExtraWhitespace
    autocmd InsertLeave * highlight ExtraWhitespace ctermbg=red guibg=red
augroup END
match ExtraWhitespace /\s\+$/
" }}}

" Fold methods. {{{
augroup c_folds
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType c setlocal foldmethod=syntax
    autocmd FileType c setlocal foldnestmax=1
augroup END
" }}}

" Allows Ctrl-Left and Ctrl-Right jump between words in
" command mode (see the actual mapping in map.vim).
" {{{
execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"
" }}}
