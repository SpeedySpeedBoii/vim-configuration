" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'rafi/awesome-vim-colorschemes' " :)

Plug 'ervandew/supertab'

Plug 'neoclide/coc.nvim', {'branch': 'release' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'

Plug 'preservim/nerdtree' " :)

" Initialize plugin system
call plug#end()
