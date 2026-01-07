#!/usr/bin/env bash
set -e

echo "Installing Alacritty..."
sudo dnf install -y alacritty fontconfig fc-cache

DOTFILES="$HOME/dotfiles"

echo "Setting up Alacritty config symlink..."
ALACRITTY_CONFIG="$HOME/.config/alacritty"
if [ -d "$ALACRITTY_CONFIG" ] || [ -L "$ALACRITTY_CONFIG" ]; then
    mv "$ALACRITTY_CONFIG" "${ALACRITTY_CONFIG}.bak.$(date +%s)"
fi
mkdir -p "$(dirname "$ALACRITTY_CONFIG")"
ln -s "$DOTFILES/alacritty" "$ALACRITTY_CONFIG"

echo "Alacritty setup complete!"
