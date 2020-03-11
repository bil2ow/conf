export GEM_USER_HOME="$HOME/.gem/ruby/2.7.0"

export PATH="$HOME/.local/bin":"$HOME/.yarn/bin":"$GEM_USER_HOME/bin":$PATH
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

export no_proxy="localhost,127.0.0.1,aur.tuna.tsinghua.edu.cn"
