#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

apt_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"
    
    sudo apt update -y
    sudo apt upgrade -y
    flatpak update -y
}

apt_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    sudo apt autoremove -y
    sudo apt autoclean -y
}

apt_update
apt_remove

echo -e "${GREEN_BOLD}[INFO] - Update Finished!!!${NO_COLOR}"