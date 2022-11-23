#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

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

dnf_update
dnf_remove

echo -e "${GREEN_BOLD}[INFO] - Update Finished!!!${NO_COLOR}"