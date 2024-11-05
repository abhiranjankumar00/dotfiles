#!/bin/bash
#Filename: setup.sh

apt_install() {
  echo "Installing $1"
  apt-get install $1
  echo "Installing $1 done."
  echo ""
}

snap_install() {
  echo "Installing $1"
  snap install $1
  echo "Installing $1 done."
  echo ""
}

# Apt packages
# apt-get update
apt_install zsh
apt_install tmux
apt_install curl
apt_install trash-cli

# Snap packages
snap refresh
snap_install code 
snap_install nvim
snap_install tree

echo "Installing nvim plugins"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
echo "Installing nvim plugins done"

echo "Installing vim plugins"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
echo "Installing vim plugins"

echo "Installing zsh"
rm -rf ~/.oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing zsh done."


# Refer this to install powerline: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

