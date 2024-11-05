#!/bin/sh

echo "Script executed from: ${PWD}"

BASEDIR=$(dirname $0)
echo "Script location: ${BASEDIR}"

update_link() {
  ln -s -i -v ${PWD}/$1  ${HOME}/$2 
}

update_link vimrc   .vimrc
update_link gvimrc  .gvimrc
update_link bashrc  .bashrc
update_link zshrc   .zshrc
update_link ghci   .ghci
update_link shell_aliases  .shell_aliases
update_link gitconfig .gitconfig

update_link keybindings.tmux .config/byobu/keybindings.tmux

# Installing neo vim
mkdir -p ${HOME}/.config/nvim
update_link init.vim .config/nvim/init.vim

mkdir -p ${HOME}/.vim/skel/
cp ${PWD}/skel/* ${HOME}/.vim/skel/

