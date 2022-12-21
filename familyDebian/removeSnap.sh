#!/bin/bash
## Variáveis ##
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

## Funções ##
snap_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Snap ${NO_COLOR}"

    snap remove firefox
    snap remove snap-store
    snap remove gnome-3-38-2004
    snap remove gtk-common-themes
    snap remove bare
    snap remove snapd-desktop-integration
    snap remove core20
    snap remove snapd
}

apt_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Integration Snap ${NO_COLOR}"

    apt remove snapd -y
}

apt_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Gnome Software ${NO_COLOR}"
    
    apt install gnome-software -y
}

## Execução do Script ##
snap_remove
apt_remove
apt_install

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"