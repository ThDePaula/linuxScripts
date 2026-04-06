#!/bin/bash
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
NO_COLOR='\e[0m'

pacman_rollback(){
    echo -e "${YELLOW_BOLD}[INFO] - Rollback Started  ${NO_COLOR}"

    sudo pacman -U https://archive.archlinux.org/packages/b/bluez/bluez-5.68-1-x86_64.pkg.tar.zst --noconfirm
    sudo pacman -U https://archive.archlinux.org/packages/b/bluez-libs/bluez-libs-5.68-1-x86_64.pkg.tar.zst --noconfirm
    sudo pacman -U https://archive.archlinux.org/packages/b/bluez-plugins/bluez-plugins-5.68-1-x86_64.pkg.tar.zst --noconfirm
    sudo pacman -U https://archive.archlinux.org/packages/b/bluez-utils/bluez-utils-5.68-1-x86_64.pkg.tar.zst --noconfirm
}

bluetooth_restart(){
    echo -e "${YELLOW_BOLD}[INFO] - Restart Bluetooth ${NO_COLOR}"

    sudo systemctl restart bluetooth.service
}

pacman_rollback
bluetooth_restart

echo -e "${GREEN_BOLD}[INFO] - Finished Rollback Execute!!! ${NO_COLOR}"