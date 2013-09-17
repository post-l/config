#!/bin/bash

sudo pacman -Syu emacs python ipython pip nodejs rlwrap
sudo pip install virtualenv flake8
npm install -g jshint

ln -sb .gitconfig ~
ln -sb .emacs ~
ln -sf .emacs.d ~
ln -sb .zshenv ~
ln -sb .zshrc ~

instruction="
Now, open emacs and do:

M-x el-get-install RET jedi
M-x package-install RET flycheck RET

If you want zsh-syntax-highlighting:
yaourt -S zsh-syntax-highlighting"

echo "$instruction"
