#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

GOOGLE_CHROME_DEB="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
VS_CODE_DEB="https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code_1.70.0-1659589288_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/Programs"
DIRETORIO_DOWNLOADS_ISO="$HOME/Downloads/ISO"
DIRETORIO_PROJECTS="$HOME/Documents/Projects"
DIRETORIO_CONNECTION="$HOME/Public/Connection"

apt_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"

    apt update -y
    apt upgrade -y
}

apt_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    apt autoremove -y
    apt autoclean -y
}

apt_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages ${NO_COLOR}"

    apt install flatpak -y
    apt install audacity -y
    apt install flameshot -y 
    apt install virtualbox -y
    apt install gnome-boxes -y
    apt install gnome-tweaks -y
    apt install gnome-characters -y
    apt install gnome-shell-extensions -y
    apt install gnome-software-plugin-flatpak -y
}

add_repo(){
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

create_folder(){
    echo -e "${YELLOW_BOLD}[INFO] - Create Folders  ${NO_COLOR}"

    mkdir "$DIRETORIO_DOWNLOADS"
    mkdir "$DIRETORIO_DOWNLOADS_ISO"
    mkdir "$DIRETORIO_PROJECTS"
    mkdir "$DIRETORIO_CONNECTION"
}

package_deb(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages .DEB ${NO_COLOR}"

    wget -c "$GOOGLE_CHROME_DEB" -P "$DIRETORIO_DOWNLOADS"
    wget -c "$VS_CODE_DEB" -P "$DIRETORIO_DOWNLOADS"

    dpkg -i $DIRETORIO_DOWNLOADS/*.deb
}

flatpak_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages Flatpak ${NO_COLOR}"
    
    flatpak install flathub org.videolan.VLC -y
    flatpak install flathub com.spotify.Client -y
    flatpak install flathub org.telegram.desktop -y
    flatpak install flathub com.bitwarden.desktop -y
    flatpak install flathub com.discordapp.Discord -y
    flatpak install flathub com.valvesoftware.Steam -y
    flatpak install flathub de.haeckerfelix.Fragments -y
    flatpak install flathub com.heroicgameslauncher.hgl -y
    flatpak install flathub com.mattjakeman.ExtensionManager -y
    flatpak install flathub com.github.unrud.VideoDownloader -y
    flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
}

apt_unlocking(){
    echo -e "${YELLOW_BOLD}[INFO] - Unlocking in APT  ${NO_COLOR}"

    rm /var/lib/apt/lists/lock
    rm /var/lib/dpkg/lock
}

dpkg_reconfig(){
    echo -e "${YELLOW_BOLD}[INFO] - Reconfig DPKG and APT  ${NO_COLOR}"

    dpkg --configure -a
    apt autoremove -y
    apt -f install -y
}

apt_unlocking
apt_update
dpkg_reconfig

apt_update

apt_install
add_repo
flatpak_install
create_folder
package_deb

apt_update
apt_remove

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"