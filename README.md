Setup Development environment
======

Clone and run this on a new Archlinux or Xubuntu
instance to configure both the machine and your individual
development environment as follows:

Archlinux
```sh
cd ~ && mkdir git && cd git
sudo pacman -Syu git
git clone https://github.com/post-l/config.git
cd config && ./setup.sh
```

Xubuntu
```sh
cd ~ && mkdir git && cd git
sudo apt-get update
sudo apt-get install git-core
git clone https://github.com/post-l/config.git
cd config && ./setup.sh
```
