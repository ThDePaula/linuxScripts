#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

DIRETORIO_DOWNLOADS_ISO="$HOME/Downloads/ISO"
DIRETORIO_PROJECTS="$HOME/Documents/Projects"
DIRETORIO_CONNECTION="$HOME/Public/Connection"
DIRETORIO_GITHUB="$HOME/Documents/Projects/GitHub/firefox-gnome-theme"

pacman_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"

    sudo pacman -Syu --noconfirm
    sudo pacman -Syy --noconfirm
}

pacman_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    sudo pacman -Rs $(pacman -Qtdq) --noconfirm
}

pacman_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages ${NO_COLOR}"

    sudo pacman -S vim --noconfirm
    sudo pacman -S flatpak --noconfirm
    sudo pacman -S docker --noconfirm
    sudo pacman -S freerdp --noconfirm
    sudo pacman -S audacity --noconfirm
    sudo pacman -S remmina --noconfirm
    sudo pacman -S gnome-boxes --noconfirm
    sudo pacman -S webapp-manager --noconfirm
    sudo pacman -S gnome-characters --noconfirm
    sudo pacman -S libpamac-flatpak-plugin --noconfirm
    sudo pacman -S gnome-software-packagekit --noconfirm
}

create_folder(){
    echo -e "${YELLOW_BOLD}[INFO] - Create Folders  ${NO_COLOR}"

    mkdir "$DIRETORIO_DOWNLOADS_ISO"
    mkdir "$DIRETORIO_PROJECTS"
    mkdir "$DIRETORIO_CONNECTION"
    mkdir "$DIRETORIO_GITHUB"
}

flatpak_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages Flatpak ${NO_COLOR}"
    
    flatpak install flathub com.slack.Slack -y
    flatpak install flathub org.videolan.VLC -y
    flatpak install flathub com.spotify.Client -y
    flatpak install flathub com.google.Chrome -y
    flatpak install flathub org.telegram.desktop -y
    flatpak install flathub com.visualstudio.code -y
    flatpak install flathub com.discordapp.Discord -y
    flatpak install flathub com.valvesoftware.Steam -y
    flatpak install flathub de.haeckerfelix.Fragments -y
    flatpak install flathub com.heroicgameslauncher.hgl -y
    flatpak install flathub com.mattjakeman.ExtensionManager -y
    flatpak install flathub com.github.unrud.VideoDownloader -y
    flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y 
}

firefox_theme(){
    echo -e "${BLUE_BOLD}[INFO] - Apply Firefox Gnome Theme ${NO_COLOR}"

    git clone https://github.com/rafaelmardojai/firefox-gnome-theme.git $DIRETORIO_GITHUB
    cd "$DIRETORIO_GITHUB" && ./scripts/install.sh
}

pacman_update

pacman_install
flatpak_install
create_folder

pacman_update
pacman_remove
firefox_theme

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"