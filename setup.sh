#!/bin/bash

sudo pacman -Syu emacs python ipython pip nodejs rlwrap
sudo pip install virtualenv flake8
sudo npm install -g jshint

sudo cp clean /usr/bin/

ln -sb "$PWD/.gitconfig" ~
ln -sb "$PWD/.emacs" ~
ln -sf "$PWD/.emacs.d" ~
ln -sb "$PWD/.zshenv" ~
ln -sb "$PWD/.zshrc" ~

instruction="
Now, open emacs and do:

M-x el-get-install RET jedi
M-x package-install RET flycheck RET

If you want zsh-syntax-highlighting:
yaourt -S zsh-syntax-highlighting"

echo "$instruction"
