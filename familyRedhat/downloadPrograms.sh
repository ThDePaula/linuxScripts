#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

GOOGLE_CHROME_RPM="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
VS_CODE_RPM="https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code-1.70.0-1659589373.el7.x86_64.rpm"

DIRETORIO_DOWNLOADS="$HOME/Downloads/Programs"
DIRETORIO_DOWNLOADS_ISO="$HOME/Downloads/ISO"
DIRETORIO_PROJECTS="$HOME/Documents/Projects"
DIRETORIO_CONNECTION="$HOME/Public/Connection"
DIRETORIO_GITHUB="$HOME/Documents/Projects/GitHub/firefox-gnome-theme"

dnf_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"

    sudo dnf update -y
    sudo dnf upgrade -y
    flatpak update -y
}

dnf_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    sudo dnf autoremove -y
    sudo dnf clean all -y
}

dnf_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages ${NO_COLOR}"

    sudo dnf install vim -y
    sudo dnf install docker -y
    sudo dnf install remmina -y
    sudo dnf install flatpak -y
    sudo dnf install audacity -y
    sudo dnf install flameshot -y
    sudo dnf install gnome-boxes -y
    sudo dnf install gnome-tweaks -y
    sudo dnf install gnome-characters -y
}

add_repo(){
    sudo flatpak remote-delete fedora
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

create_folder(){
    echo -e "${YELLOW_BOLD}[INFO] - Create Folders  ${NO_COLOR}"

    mkdir "$DIRETORIO_DOWNLOADS"
    mkdir "$DIRETORIO_DOWNLOADS_ISO"
    mkdir "$DIRETORIO_PROJECTS"
    mkdir "$DIRETORIO_CONNECTION"
    mkdir "$DIRETORIO_GITHUB"
}

package_rpm(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages .RPM ${NO_COLOR}"

    wget -c "$GOOGLE_CHROME_RPM" -P "$DIRETORIO_DOWNLOADS"
    wget -c "$VS_CODE_RPM" -P "$DIRETORIO_DOWNLOADS"

    rpm -i $DIRETORIO_DOWNLOADS/*.rpm
}

flatpak_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Packages Flatpak ${NO_COLOR}"
    
    flatpak install flathub com.slack.Slack -y
    flatpak install flathub org.videolan.VLC -y
    flatpak install flathub com.spotify.Client -y
    flatpak install flathub com.visualstudio.code -y
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

dnf_update

dnf_install
add_repo
flatpak_install
create_folder
package_rpm

dnf_update
dnf_remove
firefox_theme

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"