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

printf "Installing 'vim' plugins\n=====================\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
echo "Installing 'vim' plugins done"

echo "Installing 'nvim' plugins\n=====================\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
echo "Installing 'nvim' plugins done"

vim +PlugInstall +qall

cd ~/.vim/plugged/youcompleteme
python3 install.py --all
