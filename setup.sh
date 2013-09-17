#!/bin/bash

sudo pacman -Syu zsh emacs python ipython python-pip nodejs rlwrap
sudo pip install virtualenv flake8
sudo npm install -g jshint

chsh -s /usr/bin/zsh

sudo cp clean /usr/bin/

if [ -d ~/.emacs.d ]; then
    mv ~/.emacs.d ~/.emacs.d~
fi

ln -sb "$PWD/.gitconfig" ~
ln -sb "$PWD/.emacs" ~
ln -sf "$PWD/.emacs.d" ~
ln -sb "$PWD/.zshenv" ~
ln -sb "$PWD/.zshrc" ~

echo "Now, open emacs and do:

M-x el-get-install RET jedi
M-x package-install RET flycheck RET

If you want zsh-syntax-highlighting:

yaourt -S zsh-syntax-highlighting"
