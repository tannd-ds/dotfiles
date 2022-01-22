#!/bin/sh

# gnome-tweak-tool
echo -e "\033[0;32mInstalling Tweaks...\033[0;37m"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions
# wget && snap
echo -e "\033[0;32mInstalling wget...\033[0;37m"
sudo apt-get install wget
echo -e "\033[0;32mInstalling snap...\033[0;37m"
sudo apt install snap
echo -e "\033[0;32mInstalling git...\033[0;37m"
sudo apt install git
echo -e "\033[0;32mInstalling yarn...\033[0;37m"
sudo apt install yarn
echo -e "\033[0;32mInstalling Nodejs...\033[0;37m"
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
rm nodesource_setup.sh

# Alacrity - Terminal Emulator
echo -e "\033[0;32mInstalling Alacritty...\033[0;37m"
sudo snap install alacritty --classic
# neoVim
echo -e "\033[0;32mInstalling Vim & NeoVim...\033[0;37m"
sudo apt install vim
sudo snap install nvim --classic
echo -e "\033[0;32mInstalling tmux...\033[0;37m"
sudo apt install tmux
# Install plug.vim for NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Vim Plugins using Vim-plug
gnome-terminal -- nvim -c ':PlugInstall|q|q'
# Python
echo -e "\033[0;32mInstalling Python...\033[0;37m"
sudo apt-get install python3 python3-venv python3-pip pip
sudo pip install jupyter
# MS Teams
echo -e "\033[0;32mInstalling MS Teams...\033[0;37m"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo apt update
sudo apt install teams

## ----- MAKE SYMBOLIC LINK FOR CONFIGURATION FILES -----
echo -e "\033[0;32mCreating Symbolic links for Config files...\033[0;37m"
# in ~/ folder
for file in ~/dotfiles/home/.*; do
	ln -s ${file} ~/
done
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
cd ..

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
wget -O astronaut-wallpaper.jpg "https://docs.google.com/uc?export=download&id=19Wrrlz9RO2x9m34xGwgrOF8RGDtCfCU8"

echo "\033[0;32mTo Change Theme, open Tweaks -> Extensions and enable 'User themes'\033[0;37m"
echo "\033[0;32mTo change Wallpaper, direct to ~/Pictures/Wallpapers\033[0;37m"
