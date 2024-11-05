#!/bin/sh
#Filename: 2_install_oh_my_zsh.sh

printf "Installing 'zsh'.\n======================\n"
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing zsh done."


# Refer this to install powerline: https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

