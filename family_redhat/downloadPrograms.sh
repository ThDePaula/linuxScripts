#!/bin/bash
# ---------------------------------------------------------------- VARIÁVEIS ---------------------------------------------------------------- #
GOOGLE_CHROME_RPM="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
VISUAL_STUDIO_RPM="https://az764295.vo.msecnd.net/stable/7db1a2b88f7557e0a43fec75b6ba7e50b3e9f77e/code-1.63.0-1638855621.el7.x86_64.rpm"
VIRTUAL_BOX_RPM="https://download.virtualbox.org/virtualbox/6.1.30/VirtualBox-6.1-6.1.30_148432_fedora33-1.x86_64.rpm"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programs/"
# ------------------------------------------------------------------------------------------------------------------------------------------ #

## Atualizando o repositório ##
sudo yum update -y
sudo yum upgrade -y
## ------------------------- ##

## Instalação de programas internos ##
sudo yum install flatpak -y
sudo yum install audacity -y
sudo yum install flameshot -y
sudo yum install gnome-boxes -y
sudo yum install gnome-tweaks -y
sudo yum install gnome-characters -y
## ------------------------------------------- ##

## Download e instalação de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$GOOGLE_CHROME_RPM" -P "$DIRETORIO_DOWNLOADS"
wget -c "$VISUAL_STUDIO_RPM" -P "$DIRETORIO_DOWNLOADS"
wget -c "$VIRTUAL_BOX_RPM"   -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo yum install $DIRETORIO_DOWNLOADS/*.rmp -y
sudo yum install DIRETORIO_DOWNLOADS/*.rpm -y
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
sudo yum update -y
sudo yum upgrade -y
sudo yum autoremove -y
sudo yum clean all -y
## ---------------------------------- ##