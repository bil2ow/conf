#!/bin/sh

# mirrorlist
sudo sed -i.bak 's/^#\(Server.*tsinghua\)/\1/' /etc/pacman.d/mirrorlist
# pacman
sudo sed -i.bak '/^#\s*\[multilib\]/ {N; s/#\s*\(\[multilib\]\)\n#\s*\(Include.*\)/\1\n\2/}' /etc/pacman.conf

sudo pacman -Syyu
sudo pacman -S --noconfirm --needed \
     base-devel \
     os-prober grub efibootmgr \
     gnupg sudo \
     nvidia \
     rsync git mercurial aria2 \
     deepin deepin-screenshot deepin-terminal networkmanager \
     ibus ibus-libpinyin xclip \
     firefox \
     ttf-fira-code adobe-source-han-sans-cn-fonts \
     vim emacs code \
     aspell aspell-en \
     vulkan-devel \
     jdk-openjdk \
     nodejs npm yarn \
     ruby ruby-irb \
     python-pip python-setuptools ipython jupyter \
     opam \
     agda \
     stack \
     smlnj \
     racket


mkdir -p ~/tmp

# conf  = dotfile
git clone https://github.com/bil2ow/conf.git ~/tmp/conf
cp -r ~/tmp/conf/{.,?}* ~/

# yay
git clone https://aur.archlinux.org/yay.git ~/tmp/yay
cd ~/tmp/yay && makepkg -si --needed --noconfirm

yay -S --norebuild --noredownload --notimeupdate --pgpfetch --noremovemake --needed \
     optimus-manager jetbrains-toolbox update-grub

# optimus-manager
sudo systemctl start optimus-manager
sudo optimus-manager --set-startup nvidia

# spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# spacevim
curl -sLf https://spacevim.org/cn/install.sh | bash

rm -rf ~/tmp

# Service
systemctl --user enable emacs
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable optimus-manager

sudo update-grub