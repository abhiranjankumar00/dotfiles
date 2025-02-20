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
sudo apt-get update
apt_install snapd
apt_install python3
apt_install python3-pip
apt_install npm
apt_install zsh
apt_install tmux
apt_install curl
apt_install trash-cli
apt_install byobu
apt_install ghc
apt_install gcp
apt_install fonts-powerline

echo "Installings apps required for vim auto completion - YCM"
apt_install build-essential
apt_install cmake
apt_install vim-nox
apt_install python3-dev
apt_install mono-complete
apt_install golang
apt_install nodejs
apt_install openjdk-17-jdk
apt_install openjdk-17-jre 
apt_install npm

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

# Refer this to install powerline: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
printf "Installing 'powerline fonts'.\n======================\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/powerline/fonts/refs/heads/master/install.sh)"
echo "Installing powerline fonts done."

printf "Installing 'fzf'.\n======================\n"
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
printf "Installing 'fzf' done."

