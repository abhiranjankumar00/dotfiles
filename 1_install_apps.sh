#!/bin/sh
#Filename: 1_install_apps.sh

apt_install() {
  echo "Installing '$1' from aptitute."
  sudo apt-get install $1
  echo "Installing '$1' done."
  echo "======================"
}

snap_install() {
  echo "Installing '$1' from snap."
  sudo snap install $1
  echo "Installing '$1' done."
  echo "======================"
}

# Apt packages
echo "Updating aptitute packages."
apt-get update
apt_install python3
apt_install python3-pip
apt_install zsh
apt_install tmux
apt_install curl
apt_install trash-cli
apt_install fzf
apt_install byobu
apt_install ghc
apt_install fonts-powerline

echo "Updating python to use python3"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

echo "Enabling byobu for next login"
byobu-enable

# Snap packages
echo "Updating snap packages."
snap refresh
snap_install code 
snap_install nvim
snap_install tree

echo "Installing nvim plugins"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
echo "Installing 'nvim' plugins done"

echo "Installing vim plugins"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
echo "Installing 'vim' plugins"

#printf "Installing 'zsh'.\n======================\n"
#rm -rf ~/.oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#echo "Installing 'zsh' done."

# Refer this to install powerline: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
printf "Installing 'powerline fonts'.\n======================\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/powerline/fonts/refs/heads/master/install.sh)"
echo "Installing powerline fonts done."

