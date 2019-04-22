#!/bin/sh

mkdir -p ~/.cache

git clone https://github.com/bil2ow/conf.git ~/.cache/conf
cp -r ~/tmp/conf/{.,?}* ~/ 2> /dev/null 

git clone https://aur.archlinux.org/yay.git ~/.cache/yay-dist
cd ~/.cache/yay-dist && makepkg -si --needed --noconfirm

yay -S --nocleanmenu --norebuild --noredownload --notimeupdate --pgpfetch --noremovemake jetbrains-toolbox netease-cloud-music git-extras

systemctl --user enable emacs

cd ~