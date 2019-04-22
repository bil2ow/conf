#!/bin/sh

echo '127.0.0.1	localhost
::1		localhost' | tee /etc/hosts

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
# sync time with windows
timedatectl set-local-rtc 1

sed -i.bak 's/^\(#\s*\(en_US|zh_CN\).UTF-8\sUTF-8\)/\1/' /etc/locale.gen
locale-gen

echo 'White-Rabbit' | tee /etc/hostname

# mirrorlist
sed -i.bak 's/^#\(Server.*tsinghua\)/\1/' /etc/pacman.d/mirrorlist
# pacman
sed -i.bak '/^#\s*\[multilib\]/ {N; s/#\s*\(\[multilib\]\)\n#\s*\(Include.*\)/\1\n\2/}' /etc/pacman.conf

pacman -Syu
pacman -S --noconfirm --needed \
     base-devel \
     os-prober grub efibootmgr \
     nvidia \
     rsync git mercurial aria2 \
     deepin deepin-screenshot deepin-terminal networkmanager \
     ibus ibus-libpinyin xclip \
     firefox \
     ttf-fira-code ttf-droid ttf-hack adobe-source-han-sans-cn-fonts adobe-source-code-pro-fonts\
     vim emacs code \
     aspell aspell-en \
     vulkan-devel cmake\
     jdk-openjdk \
     nodejs npm yarn \
     ruby ruby-irb \
     python-pip python-setuptools ipython jupyter \
     opam \
     agda \
     stack \
     smlnj \
     racket

systemctl enable NetworkManager
systemctl enable lightdm

# Initramfs
mkinitcpio -p linux

# grub
sed -i.bak '/^GRUB_SAVEDEFAULT.*$/d; /^GRUB_DEFAULT.*$/d' /etc/default/grub
echo 'GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true' | tee -a /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# sudo
sed -i.bak 's/^#\s*\(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers
