mkdir ~/.vim/bundle
mkdir ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
python ~/.vim/bundle/YouCompleteMe/install.py --all
