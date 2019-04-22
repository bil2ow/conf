#!/bin/sh

echo '127.0.0.1	localhost
::1		localhost' | tee /etc/hosts

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
# sync time with windows
timedatectl set-local-rtc 1

echo  'en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8' | tee /etc/locale.conf

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
     gnupg \
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

# use a nonroot user
echo "Enter username to use:"
read username
echo "Enter password:"
read -s password
if ! id -u $username > /dev/null 2> /dev/null; then
    echo "No user $username, Create"
    echo $username $password
    useradd $username -G wheel,kvm -p $password
fi

userHome="/home/$username"
mkdir -p "$userHome/tmp"
chown -hR $username:$username $userHome

su $username -c '
# conf = dotfile
git clone https://github.com/bil2ow/conf.git ~/tmp/conf
cp -r ~/tmp/conf/{.,?}* ~/ 2> /dev/null 

# yay
git clone https://aur.archlinux.org/yay.git ~/tmp/yay
cd ~/tmp/yay && makepkg -si --needed --noconfirm

rm -rf ~/tmp

yay -S --nocleanmenu --norebuild --noredownload --notimeupdate --pgpfetch --noremovemake\
     optimus-manager jetbrains-toolbox

# spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
systemctl --user enable emacs

# spacevim
curl -sLf https://spacevim.org/cn/install.sh | bash
'

systemctl enable optimus-manager
systemctl start optimus-manager
optimus-manager --set-startup nvidia
