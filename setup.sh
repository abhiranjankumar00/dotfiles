#!/bin/bash
#Filename: setup.sh

sudo apt-get install zsh
sudo apt-get install tmux
sudo apt-get install tree

sudo snap install code 
sudo apt-get install nvim
sudo apt-get install curl

ln -s -i -v ~/.vim/vimrc   ~/.vimrc
ln -s -i -v ~/.vim/gvimrc  ~/.gvimrc
ln -s -i -v ~/.vim/bashrc  ~/.bashrc
ln -s -i -v ~/.vim/zshrc   ~/.zshrc
ln -s -i -v ~/.vim/ghci   ~/.ghci
ln -s -i -v ~/.vim/shell_aliases  ~/.shell_aliases
ln -s -i -v ~/.vim/gitconfig ~/.gitconfig

# Installing neo vim
mkdir -p ~/.config/nvim
ln -s -i -v ~/.vim/init.vim ~/.config/nvim/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Refer this to install powerline: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

