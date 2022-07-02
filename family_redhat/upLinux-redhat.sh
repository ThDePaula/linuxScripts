#!/bin/bash
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf autoremove -y
sudo dnf clean all -y
flatpak update -y