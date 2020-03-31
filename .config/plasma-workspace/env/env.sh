export ANDROID_SDK_HOME="$HOME/Android/Sdk"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export GEM_USER_HOME="$HOME/.gem/ruby/2.7.0"
export PATH=$PATH:$GEM_USER_HOME/bin

export PATH=$PATH:"$HOME/.local/bin":"$HOME/.yarn/bin"

export MANPATH="/usr/man":"/usr/share/man":"/usr/local/man":"/usr/local/share/man"

# Pipenv
export PIPENV_PYPI_MIRROR=https://pypi.tuna.tsinghua.edu.cn/simple

# Rustup
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# Go proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.io

# Dart pub
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub/"

# Flutter
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"

# export all_proxy=socks5://192.168.1.6:7891
# export ALL_PROXY=$all_proxy
# export HTTP_PROXY=$all_proxy
# export HTTPS_PROXY=$all_proxy
export no_proxy="localhost,127.0.0.1,aur.tuna.tsinghua.edu.cn"

