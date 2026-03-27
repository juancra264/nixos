#!/bin/bash

# #############################################################################
## Set Colors for echo messages
# #############################################################################
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# 1. Definir el disco (Asegúrate de que sea el correcto)
DRIVE="/dev/vda"

# 2. Particionamiento automático (limpia el disco y crea particiones)
# Creamos una partición EFI de 512MB y el resto para Root
#sgdisk --zap-all $DRIVE
#sgdisk -n 1:0:+512M -t 1:ef00 -c 1:boot $DRIVE
#sgdisk -n 2:0:0      -t 2:8300 -c 2:nixos $DRIVE

# 3. Formateo
#mkfs.fat -F 32 -n boot "${DRIVE}1"
#mkfs.ext4 -L nixos "${DRIVE}2"

# 4. Montaje
#mount /dev/disk/by-label/nixos /mnt
#mkdir -p /mnt/boot
#mount /dev/disk/by-label/boot /mnt/boot


# Habilitar flakes temporalmente en la ISO
export NIX_CONFIG="experimental-features = nix-command flakes"

# Ejecutar disko
echo "${blue}###############################################################################${reset}"
echo "${blue} Deploying disko for disk partitions and mounting filesystem ${reset}"
echo "${blue}###############################################################################${reset}"
nix run github:nix-community/disko -- --mode zap_create_mount ./disko-config.nix

# 5. Generar configuración base
echo "${blue}###############################################################################${reset}"
echo "${blue} Generating default configuration for NIXOS${reset}"
echo "${blue}###############################################################################${reset}"
nixos-generate-config --root /mnt

# 6. (Opcional) Sobrescribir con tu propia configuración o Flake
# Si tienes un repositorio de dotfiles:
# nix-shell -p git --run "git clone https://github.com/tu-usuario/nixos-config /mnt/etc/nixos"

# 7. Instalar
echo "${blue}###############################################################################${reset}"
echo "${blue} Installing NIXOS${reset}"
echo "${blue}###############################################################################${reset}"
read -r -p "Want to reboot the system? [y/N]" -n 1
echo # (optional) move to a new line
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    nixos-install --no-root-passwd
fi

echo "${green}###############################################################################${reset}"
echo "${green} Installation and pre configuration complete !!!! ${reset}"
echo "${green}###############################################################################${reset}"

echo "${red}###############################################################################${reset}"
echo "${red} Please reboot the system${reset}"
echo "${red}###############################################################################${reset}"
read -r -p "Want to reboot the system? [y/N]" -n 1
echo # (optional) move to a new line
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    reboot
fi
