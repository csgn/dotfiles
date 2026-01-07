# dotfiles

This repository contains my personal configuration for Neovim, Tmux, and Alacritty, along with setup scripts for easy installation on Linux.

---

## Overview

This repository manages:

- **Neovim**: Fully configured with lazy.nvim, Treesitter, CMP, LSP, Harpoon, and Conform.  
- **Tmux**: Custom keybindings and statusline.  
- **Alacritty**: Terminal configuration with preferred font, colorscheme, and keybindings.  

All configs are symlinked from the repository to the proper locations in your home directory.

---

## Installation
```sh
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the setup scripts:
```sh
# for Neovim
cd nvim
./setup.sh

# for Tmux
cd tmux
./setup.sh

# for Alacritty
cd alacritty
./setup.sh
```