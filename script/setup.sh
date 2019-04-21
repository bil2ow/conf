#!/bin/sh

sudo pacman -Syyu
sudo pacman -S --noconfirm --needed base-devel \
     rsync mercurial aria2 \
     deepin deepin-screenshot deepin-terminal networkmanager \
     ibus ibus-libpinyin xclip \
     ttf-fira-code adobe-source-han-sans-cn-fonts \
     code \
     vulkan-devel \
     jdk-openjdk \
     nodejs npm yarn \
     ruby ruby-irb \
     python-pip python-setuptools ipython jupyter \
     opam \
     agda \
     stack \
     smlnj \
     racket \
     os-prober aspell aspell-en \
