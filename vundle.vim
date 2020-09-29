set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " :)

Plugin 'rafi/awesome-vim-colorschemes' " :)

Plugin 'ycm-core/YouCompleteMe' " :)

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'airblade/vim-gitgutter.git'

Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'

" Plugin 'easymotion/vim-easymotion'

" Plugin 'unblevable/quick-scope' " :)

" Plugin 'preservim/nerdcommenter'

" Plugin 'vim-syntastic/syntastic' " :)

" Plugin 'ycm-core/YouCompleteMe'

" Plugin 'honza/vim-snippets'

Plugin 'preservim/nerdtree' " :)

"Plugin 'vim-scripts/cscope.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
helptags ~/.vim/bundle/Vundle.vim/doc

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
