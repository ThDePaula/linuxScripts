#!/bin/bash
## VARIÁVEIS ##
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_4K_VIDEO_DOWNLOADER="https://dl.4kdownload.com/app/4kvideodownloader_4.15.1-1_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
## ---------- ##

## Atualizando o repositório ##
sudo apt update -y
sudo apt dist-upgrade -y
## ------------------------- ##

## Instalação de programas internos ##
sudo apt install code -y
sudo apt install flatpak -y
sudo apt install audacity -y
sudo apt install flameshot -y 
sudo apt install virtualbox -y
sudo apt install gnome-boxes -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-characters -y
## -------------------------------- ##

## Download e instalação de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_4K_VIDEO_DOWNLOADER" -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
## ------------------------------------------- ##

## Instalando Pacotes Flatpak ##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.getferdi.Ferdi -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.github.calo001.fondo -y
flatpak install flathub de.haeckerfelix.Fragments -y
#Para verificar quais apps Flatpak instaldos usar o comando: flatpak list#
## ----------------------- ##

## Finalização, atualização e limpeza ##
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y
## ---------------------------------- ##