# 快速启动

## 恢复用户配置文件

```bash
git clone https://github.com/iovw/dotfiles.git -b master dotfiles
cp -r dotfiles/{.,?}* ~/
```

## 恢复系统配置文件

```
git clone https://github.com/iovw/etcfiles.git -b master etcfiles
sudo cp -rf etcfiles/{.,?}* /etc/
```

## 添加几个仓库

### 导入 GPG key

```bash
sudo pacman -S archlinuxcn-keyring blackarch-keyring
```

## 其它

### 解决双系统时间同步

```bash
timedatectl set-local-rtc true
```