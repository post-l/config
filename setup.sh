#!/bin/bash

if [ -f /etc/arch-release ]; then
    sudo pacman -Syu zsh emacs python ipython python-pip nodejs rlwrap most
else
    sudo apt-get install python-software-properties
    sudo apt-get update
    sudo apt-get install zsh emacs24 ipython3 python3-pip nodejs rlwrap npm most
fi
sudo pip3 install virtualenv flake8
sudo npm install -g jshint

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

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
M-x package-install RET flycheck RET"
