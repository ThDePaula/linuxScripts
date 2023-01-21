#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

snap_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Snap ${NO_COLOR}"

    sudo snap remove firefox
    sudo snap remove snap-store
    sudo snap remove gnome-3-38-2004
    sudo snap remove gtk-common-themes
    sudo snap remove bare
    sudo snap remove snapd-desktop-integration
    sudo snap remove core20
    sudo snap remove snapd
}

apt_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Integration Snap ${NO_COLOR}"

    sudo apt remove snapd -y
}

apt_install(){
    echo -e "${BLUE_BOLD}[INFO] - Install Gnome Software ${NO_COLOR}"
    
    sudo apt install gnome-software -y
}

snap_remove
apt_remove
apt_install

echo -e "${GREEN_BOLD}[INFO] - Finished Execute!!! ${NO_COLOR}"