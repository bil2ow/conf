#!/bin/sh

hwclock --systohc
# sync time with windows
timedatectl set-local-rtc true

locale-gen

pacman -Syu
pacman -S --noconfirm --needed \
     base-devel \
     os-prober grub efibootmgr \
     ntfs-3g screenfetch \
     nvidia \
     rsync git mercurial aria2 \
     deepin deepin-screenshot deepin-terminal file-roller networkmanager \
     ibus ibus-libpinyin xclip \
     firefox chromium thunderbird \
     ttf-fira-code ttf-droid ttf-hack adobe-source-han-sans-cn-fonts adobe-source-code-pro-fonts\
     vim emacs code \
     aspell aspell-en \
     vulkan-devel cmake\
     jdk-openjdk \
     nodejs npm yarn bower \
     ruby ruby-irb \
     python-pip python-setuptools ipython jupyter \
     opam \
     agda \
     stack \
     # smlnj \
     racket \
     go
     
systemctl enable NetworkManager
systemctl enable lightdm
systemctl enable rsync

# Initramfs
mkinitcpio -p linux

# grub
grub-mkconfig -o /boot/grub/grub.cfg

# TODO: how to clone a private repo ?
