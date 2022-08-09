#!/bin/bash
## VARIÁVEIS ##
GOOGLE_CHROME_RPM="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
VISUAL_STUDIO_RPM="https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code-1.70.0-1659589373.el7.x86_64.rpm"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programs"
## ---------- ##

## Atualizando o repositório ##
sudo dnf update -y
sudo dnf upgrade -y
## ------------------------- ##

## Instalação de programas internos ##
sudo dnf install flatpak -y
sudo dnf install audacity -y
sudo dnf install flameshot -y
sudo dnf install gnome-boxes -y
sudo dnf install gnome-tweaks -y
sudo dnf install gnome-characters -y
## -------------------------------- ##

## Download e instalação de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$GOOGLE_CHROME_RPM" -P "$DIRETORIO_DOWNLOADS"
wget -c "$VISUAL_STUDIO_RPM" -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dnf install $DIRETORIO_DOWNLOADS/* -y
## ------------------------------------------- ##

## Instalando Pacotes Flatpak ##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub net.pcsx2.PCSX2 -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.github.calo001.fondo -y
flatpak install flathub de.haeckerfelix.Fragments -y
flatpak install flathub com.heroicgameslauncher.hgl -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub com.github.unrud.VideoDownloader -y
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y
#Para verificar quais apps Flatpak instaldos usar o comando: flatpak list#
## -------------------------- ##

## Finalização, atualização e limpeza ##
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf autoremove -y
sudo dnf clean all -y
## ---------------------------------- ##
