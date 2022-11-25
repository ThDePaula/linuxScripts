#!/bin/bash
## Variáveis ##
GOOGLE_CHROME_DEB="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
VISUAL_STUDIO_DEB="https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code_1.70.0-1659589288_amd64.deb"
VIDEO_DOWNLOADER_DEB="https://dl.4kdownload.com/app/4kvideodownloader_4.21.1-1_amd64.deb?source=website"

DIRETORIO_DOWNLOADS="$HOME/Downloads/Programs"
DIRETORIO_DOWNLOADS_ISO="$HOME/Downloads/ISO"
DIRETORIO_PROJECTS="$HOME/Documents/Projects"
DIRETORIO_CONNECTION="$HOME/Public/Connection"

## Funções ##
apt_update(){
    apt update -y
    apt upgrade -y
}

apt_remove(){
    apt autoremove -y
    apt autoclean -y
}

apt_install(){
    apt install code -y
    apt install flatpak -y
    apt install audacity -y
    apt install flameshot -y 
    apt install virtualbox -y
    apt install gnome-boxes -y
    apt install gnome-tweaks -y
    apt install gnome-characters -y
    apt install gnome-shell-extensions -y
}

add_repo(){
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

create_folder(){
    mkdir "$DIRETORIO_DOWNLOADS"
    mkdir "$DIRETORIO_DOWNLOADS_ISO"
    mkdir "$DIRETORIO_PROJECTS"
    mkdir "$DIRETORIO_CONNECTION"
}

package_deb(){
    wget -c "$GOOGLE_CHROME_DEB" -P "$DIRETORIO_DOWNLOADS"
    wget -c "$VISUAL_STUDIO_DEB" -P "$DIRETORIO_DOWNLOADS"
    wget -c "$VIDEO_DOWNLOADER_DEB" -P "$DIRETORIO_DOWNLOADS"

    dpkg -i $DIRETORIO_DOWNLOADS/*.deb
}

flatpak_install(){
    flatpak install flathub net.pcsx2.PCSX2 -y
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

## Execução de Script ##
# Adiciona Repositórios
add_repo

# Atualiza repositórios
apt_update

# Instala Programas
apt_install
flatpak_install
create_folder
package_deb

# Remove dependência legada
apt_remove