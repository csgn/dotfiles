#!/usr/bin/env bash
set -e

# --------------------------------------
# Basic Neovim Setup Script
# --------------------------------------

# Update system
echo "Updating system..."
sudo dnf update -y

# Install required packages
echo "Installing system dependencies..."
sudo dnf install -y \
    ripgrep \
    fd-find \
    python3 \
    python3-pip \
    nodejs \
    npm \
    git \
    curl \
    unzip

# Install tree-sitter CLI globally
echo "Installing tree-sitter-cli..."
npm install -g tree-sitter-cli

# Install Neovim Python support
echo "Installing neovim Python package..."
pip3 install --user neovim

# Install Neovim Node support
echo "Installing neovim Node package..."
npm install -g neovim

# Symlink Neovim config (~/.config/nvim -> ~/dotfiles/nvim)
echo "Setting up Neovim config symlink..."
DOTFILES="$HOME/dotfiles/nvim"
NVIM_CONFIG="$HOME/.config/nvim"

if [ -d "$NVIM_CONFIG" ] || [ -L "$NVIM_CONFIG" ]; then
    echo "Backing up existing config..."
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak.$(date +%s)"
fi

mkdir -p "$(dirname "$NVIM_CONFIG")"
ln -s "$DOTFILES" "$NVIM_CONFIG"

# Optional: Install lazy.nvim automatically
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_PATH" ]; then
    echo "Installing lazy.nvim..."
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
fi

echo "Neovim setup complete!"
echo "Run :Lazy sync inside Neovim to install plugins."
