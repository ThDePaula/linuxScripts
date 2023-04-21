#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

DIRETORIO_DOWNLOADS_ISO="$HOME/Downloads/ISO"
DIRETORIO_PROJECTS="$HOME/Documents/Projects"
DIRETORIO_CONNECTION="$HOME/Public/Connection"

pacman_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"

    sudo pacman -Syu
    sudo pacman -Syy
}

pacman_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    sudo pacman -Rs $(pacman -Qtdq) --noconfirm
}

pacman_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages ${NO_COLOR}"

    sudo pacman -S vim --noconfirm
    sudo pacman -S flatpak --noconfirm
    sudo pacman -S remmina --noconfirm
    sudo pacman -S audacity --noconfirm
    sudo pacman -S gnome-boxes --noconfirm
    sudo pacman -S gnome-characters --noconfirm
    sudo pacman -S libpamac-flatpak-plugin --noconfirm
}

create_folder(){
    echo -e "${YELLOW_BOLD}[INFO] - Create Folders  ${NO_COLOR}"

    mkdir "$DIRETORIO_DOWNLOADS_ISO"
    mkdir "$DIRETORIO_PROJECTS"
    mkdir "$DIRETORIO_CONNECTION"
}

flatpak_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages Flatpak ${NO_COLOR}"
    
    flatpak install flathub com.slack.Slack -y
    flatpak install flathub org.videolan.VLC -y
    flatpak install flathub com.google.Chrome -y
    flatpak install flathub com.spotify.Client -y
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

pacman_update

pacman_install
flatpak_install
create_folder

pacman_update
pacman_remove

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"