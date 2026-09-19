# Welcome to Jalapeno Config Dotfiles (by NydeTVs)
<img src="https://gitlab.com/uploads/-/system/project/avatar/40517887/68747470733a2f2f692e696d6775722e636f6d2f367146436c41312e706e67.png" alt="NixOS Logo" width="200"/>

This project is a fork of NydeTVs' NixOS dotfiles, designed to be highly portable and work out-of-the-box on most laptops. 

## 📋 System Overview
- **WM:** MangoWM
- **OS:** NixOS (configured via Home Manager)
- **Grub Theme:** [Circle Particle Theme](https://github.com/yeyushengfan258/Particle-circle-grub-theme/blob/main/releases/Particle-circle-window-grub-themes.tar.xz)
- **SDDM Theme:** [SilentSDDM](https://github.com/uiriansan/SilentSDDM)
- **Icon Theme:** [Colloid Dark](https://github.com/vinceliuice/Colloid-icon-theme)

## ⚠️ Requirements
- **Storage:** You need at least **20-25GB** of free space to run this configuration properly.

## 🚀 How to Install
Most of the configuration is handled automatically by the installation script, but a few manual steps are required.

### 1. Run the Installer
Grant execution rights to the script and run it:
```bash
chmod +x install.sh
./install.sh
```
*The script will ask for your desired username and hostname, replace the default values, generate your hardware config, and initialize a fresh Git repository.*

### 2. Post-Installation Steps
Once the script has finished and your system has rebooted, please perform these manual changes:
- **Git Configuration:** The script sets a temporary Git user. Update it with your own credentials:
  ```bash
  git config user.name "Your Name"
  git config user.email "your.email@example.com"
  ```
- **Bash Alias Fix:** Open `modules/home/bash.nix` and replace the placeholder with the absolute path to your config folder. If you skip this, the custom Nix aliases won't work.
- **Remote Repository:** NixOS Flakes require files to be tracked by Git. It is **highly recommended** to push your new local repository to an online platform (GitHub/GitLab) using `git remote add origin <YOUR_URL>`.

## ⚙️ Hardware Tweaks
If the default configuration doesn't perfectly match your hardware, check these common fixes:
- **Screen Brightness:** If your brightness control keys don't work, open `hosts/YOUR_HOSTNAME/boot.nix` and remove `acpi_backlight=native`.
- **Screen Resolution/Rotation:** The script assumes your main screen is named `eDP-1`. You can verify your screen name with `wlr-randr` and update it in `modules/home/mango.nix` (for scaling) and `modules/home/scripts.nix` (for rotation).
- **Audio (PulseAudio vs Pipewire):** PulseAudio is enabled by default because Pipewire caused crashes on the original setup. However, Pipewire is the modern standard. I **highly recommend** enabling Pipewire in `hosts/YOUR_HOSTNAME/hardware.nix`. If you encounter audio crashes, simply disable it again.
- **Extra Features:** Options like fingerprint readers are included but commented out. Explore the files to enable any missing hardware features!

## 🎨 Customization
- **Wallpapers:** Replace `assets/wallpaper/nixwp.png` (or `nixlock.png` / `nixsesslock.png`) with your own images. Keep the original filenames to avoid having to change the code!
- **Colors:** Open `modules/home/theme.nix`. **Everything** related to the color palette is centralized in this file.
- **Keybinds & Scale:** Modify `modules/home/mango.nix` to change your shortcuts or interface size.
- **Keyboard Layout:** The default layout is French (OSS) with Caps Lock acting as Shift Lock. To change this, edit both `modules/home/mango.nix` and `modules/desktop.nix`.