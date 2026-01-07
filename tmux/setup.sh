#!/usr/bin/env bash
set -e

echo "Installing tmux..."
sudo dnf install -y tmux

DOTFILES="$HOME/dotfiles"

echo "Setting up tmux config symlink..."
TMUX_CONF="$HOME/.tmux.conf"
if [ -f "$TMUX_CONF" ] || [ -L "$TMUX_CONF" ]; then
    mv "$TMUX_CONF" "${TMUX_CONF}.bak.$(date +%s)"
fi
ln -s "$DOTFILES/tmux/.tmux.conf" "$TMUX_CONF"

echo "Tmux setup complete! Restart tmux sessions to apply config."
