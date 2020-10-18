sudo snap install -y ccls --classic
sudo apt install -y nodejs
rm -rf bundle
mkdir ~/.vim/bundle
mkdir ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
