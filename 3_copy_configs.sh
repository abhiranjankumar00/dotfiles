#!/bin/bash
#Filename: setup.sh

echo "Script executed from: ${PWD}"

BASEDIR=$(dirname $0)
echo "Script location: ${BASEDIR}"

update_link() {
  ln -s -i -v ${PWD}/$1  ${HOME}/$2 
}

# ln -s -i -v ${PWD}/vimrc   ~/.vimrc
# ln -s -i -v ${PWD}/gvimrc  ~/.gvimrc
# ln -s -i -v ${PWD}/bashrc  ~/.bashrc
# ln -s -i -v ${PWD}/zshrc   ~/.zshrc
# ln -s -i -v ${PWD}/ghci   ~/.ghci
# ln -s -i -v ${PWD}/shell_aliases  ~/.shell_aliases
# ln -s -i -v ${PWD}/gitconfig ~/.gitconfig

update_link vimrc   .vimrc
update_link gvimrc  .gvimrc
update_link bashrc  .bashrc
update_link zshrc   .zshrc
update_link ghci   .ghci
update_link shell_aliases  .shell_aliases
update_link gitconfig .gitconfig

#ln -s -i -v ${PWD}/keybindings.tmux ~/.config/byobu/keybindings.tmux
update_link keybindings.tmux .config/byobu/keybindings.tmux

# Installing neo vim
mkdir -p ~/.config/nvim
#ln -s -i -v ${PWD}/init.vim ~/.config/nvim/
update_link init.vim .config/nvim/init.vim


# Refer this to install powerline: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

