#!/bin/sh

cd ~
mkdir removeLater

# gnome-tweak-tool
echo -e "\033[0;32mInstalling Tweaks...\033[0;37m"
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions

## ----- MAKE SYMBOLIC LINK FOR CONFIGURATION FILES -----
echo -e "\033[0;32mCreating Symbolic links for Config files...\033[0;37m"
# in ~/ folder
rm ~/.bashrc
for file in ~/dotfiles/home/.*; do
	ln -sf ${file} ~/
done

# in ~/.config folder
if [ -d ~/.config ]
then
	echo ".config exists in home directory..."
	ln -sf ~/dotfiles/.config/* ~/.config/
else
	echo ".config doesn't exist, create one..."
	ln -sf ~/dotfiles/.config ~/
fi

# Helper
echo -e "\033[0;32mInstalling wget...\033[0;37m"
sudo apt-get install wget
echo -e "\033[0;32mInstalling curl...\033[0;37m"
sudo apt install curl
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

# Python
echo -e "\033[0;32mInstalling Python...\033[0;37m"
sudo apt-get install python3 python3-venv python3-pip pip
sudo pip install jupyter

# MS Teams
echo -e "\033[0;32mInstalling MS Teams...\033[0;37m"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
sudo apt update
sudo apt install teams

# Install plug.vim for NeoVim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Vim Plugins using Vim-plug
gnome-terminal -- nvim -c ':PlugInstall|q|q'

# install Orchis Theme
echo -e "\033[0;32mInstalling Orchis Themes...\033[0;37m"
cd ~/removeLater
git clone https://github.com/vinceliuice/Orchis-theme orchis-theme
cd orchis-theme
./install.sh -t grey

# install Powerline font (for vim statusline)
echo -e "\033[0;32mInstalling Powerline Fonts...\033[0;37m"
cd ~/removeLater
git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
./install.sh

# Install Chrome
echo -e "\033[0;32mInstalling Chrome...\033[0;37m"
cd ~/removeLater
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

cd ~/removeLater
git clone https://gitlab.gnome.org/GNOME/gnome-shell-extensions gnome-shell-extensions
mv gnome-shell-extensions/extensions/user-theme/ ~/.local/share/gnome-shell/

# Download Wallpaper
wget -O ~/Pictures/astronaut-wallpaper.jpg "https://docs.google.com/uc?export=download&id=19Wrrlz9RO2x9m34xGwgrOF8RGDtCfCU8"

# Remove unused files (~/removeLater)
rm -r ~/removeLater

# Markdown packages
sudo apt install pandoc zathura
sudo apt install texlive-latex-extra
sudo apt-get install texlive-xetex # Required for Unicode Text (wrote in Vietnamese)

echo "\033[0;32mTo Change Theme, open Tweaks -> Extensions and enable 'User themes'\033[0;37m"
echo "\033[0;32mTo change Wallpaper, direct to ~/Pictures/\033[0;37m"
