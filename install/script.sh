#!/bin/sh

## ----- PACKAGES -----
## System
# gnome-tweak-tool
echo -e "\033[0;32mInstalling Tweaks...\033[0;37m"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions
# wget
sudo apt-get install wget

# Alacrity - Terminal Emulator
echo -e "\033[0;32mInstalling Alacritty...\033[0;37m"
sudo snap install alacritty
# neoVim
echo -e "\033[0;32mInstalling Vim & NeoVim...\033[0;37m"
sudo apt install neovim
sudo apt install vim
# Python
echo -e "\033[0;32mInstalling Python...\033[0;37m"
sudo apt-get install python3 python3-venv python3-pip pip
sudo pip install jupyter
# MS Teams
echo -e "\033[0;32mInstalling MS Teams...\033[0;37m"
sudo apt install teams

## ----- MAKE SYMBOLIC LINK FOR CONFIGURATION FILES -----
echo -e "\033[0;32mCreating Symbolic links for Config files...\033[0;37m"
# in ~/ folder
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.vim ~/
# in ~/.config folder
ln -s ~/dotfiles/.config/* ~/.config/

cd ~/dotfiles/install
mkdir removeLater
cd removeLater

# install Orchis Theme
cd ~/dotfiles/install/removeLater
echo -e "\033[0;32mInstalling Orchis Themes...\033[0;37m"
git clone https://github.com/vinceliuice/Orchis-theme orchis-theme
cd orchis-theme
./install.sh -t grey

# install Powerline font (for vim statusline)
echo -e "\033[0;32mInstalling Powerline Fonts...\033[0;37m"
git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
./install.sh
cd ..

# Install Chrome
echo -e "\033[0;32mInstalling Chrome...\033[0;37m"
cd ~/dotfiles/install/removeLater
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Download Wallpaper
cd ~/Pictures
mkdir Wallpapers
cd Wallpapers
wget -O astronaut-wallpaper.jpg "https://docs.google.com/uc?export=download&id=19Wrrlz9RO2x9m34xGwgrOF8RGDtCfCU8"

# Install Vim Plugins using Vim-plug
vim -c ':PlugInstall'

echo "\033[0;32mTo Change Theme, open Tweaks -> Extensions and enable 'User themes'\033[0;37m"
echo "\033[0;32mTo change Wallpaper, direct to ~/Pictures/Wallpapers\033[0;37m"
