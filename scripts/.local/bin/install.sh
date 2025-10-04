#!/bin/bash

sudo pacman -Syu --noconfirm needed-devel neovim lsd chromium waybar dunst wofi \
discord ghostty libreoffice-still btop zathura lazygit docker docker-compose\
curl wget lua hyprpaper hyprlock slurp grim git viewnior bluetui wiremix\
pamixer zip unzip wl-clipboard xdebug php vlc wget typst\
nerd-fonts tmux stow ripgrep fd postgresql python-debug\
npm noto-fonts-emoji networkmanager luarocks less git-delta\
fzf fastfetch bluez chafa nwg-look jq yq yazi hyprsunset iwd

sudo usermod -aG docker $USER
newgrp docker

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru

paru -Syu --noconfirm ddev-bin brave-bin lazydocker pomodorolm-bin spotify visual-studio-code-bin
mkcert -install

curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
curl -sS https://starship.rs/install.sh | sh -s -- -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

cargo install --force bat pokeget clock-rs

git config --global user.name "S.Alepakos"
git config --global user.email "spyr1996@gmail.com"
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.line-numbers true
git config --global delta.side-by-side true
git config --global merge.conflictStyle zdiff3
git config --global pull.rebase false

cat bashstuff >> $HOME/.bashrc

cd ..
mv dotfiles-linux .dotfiles
cd .dotfiles
stow *
cd ..
