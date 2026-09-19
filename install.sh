#!/usr/bin/env bash

set -e 

echo "="
echo "Welcome to Jalapeno Config's Installator"
echo "="
echo ""

# Ask for hostname/username
read -p "Please enter the desired name for your user :" NEW_USER
read -p "Please enter the desired hostname for this computer :" NEW_HOST

if [ -z "$NEW_USER" ] \vert{}\vert{} [ -z "$NEW_HOST" ]; then
  echo "Error : username and hostname can't be empty."
  exit 1
fi

echo ""
echo "[1/6] Removing Git tracking..."
rm -rf .git 

echo "[2/6] Setting up the new user..."
find . -type f \( -name "*.nix" -o -name "*.md" \) -exec sed -i "s/default-user/$NEW_USER/g" {} +
echo "[3/6] Setting up the new host"
find . -type f \( -name "*.nix" -o -name "*.md" \) -exec sed -i "s/default-hostname/$NEW_HOST/g" {} +
mv "hosts/default-hostname" "hosts/$NEW_HOST"

echo "[4/6] Generating hardware config (requires sudo) ..."
sudo nixos-generate-config --show-hardware-config > "hosts/$NEW_HOST/hardware-configuration.nix"
sed -i 's|#\s*./hardware-configuration.nix.*|./hardware-configuration.nix|' "hosts/$NEW_HOST/configuration.nix"

echo "[5/6] Initalizing a new git repo"
git init
git add .

git config user.name "NixOS Installer"
git config user.email "installer@localhost"

git commit -m "Initial commit - Adaptation de la configuration pour $NEW_HOST"

echo "[6/6] Compiling the new configuration (requires sudo) ..."
sudo nixos-rebuild switch --flake .#$NEW_HOST

echo ""
echo "Now please set your password for $NEW_USER"
sudo passwd "$NEW_USER"

echo ""
echo "="
echo "  Config installation has terminated successfully !                "
echo "="
echo ""
echo "You will now need to reboot to apply the new config and launch MangoWM."
