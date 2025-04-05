![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

# Estebandev Neovim

## Features

- Minimal UI - vanilla
- Telescope (Find files, symbols, words, git files)
- LSP native nvim 0.11
- Autoformatting

## Install

```bash
git clone https://github.com/Esteban528/nvim.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
cd ~/.config/nvim
nvim
```

## Replace (No override old config)
```bash
mv ~/.config/nvim ~/.config/nvim.old
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/Esteban528/nvim.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
cd ~/.config/nvim
nvim
```

## Uninstall

```bash
rm -rf ~/.config/nvim 
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

> [!NOTE]  
> I have removed as many plugins as possible with the idea of having a simple and effective environment, I eliminated many functions so I left only the essentials.
