#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

pacman_update(){
    echo -e "${BLUE_BOLD}[INFO] - System Update ${NO_COLOR}"

    sudo pacman -Syu
    sudo pacman -Syy
    flatpak update -y
}

pacman_remove(){
    echo -e "${YELLOW_BOLD}[INFO] - Remove Legacy Packages ${NO_COLOR}"

    sudo pacman -Rs $(pacman -Qtdq) --noconfirm
}

pacman_update
pacman_remove

echo -e "${GREEN_BOLD}[INFO] - Update Finished!!!${NO_COLOR}"