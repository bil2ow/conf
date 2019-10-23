# ~/.opam/opam-init/variables.fish
export OPAM_SWITCH_PREFIX='/home/iov/.opam/default'
export CAML_LD_LIBRARY_PATH='/usr/lib/ocaml/stublibs:/usr/lib/ocaml'
export CAML_LD_LIBRARY_PATH='/home/iov/.opam/default/lib/stublibs':"$CAML_LD_LIBRARY_PATH"
export OCAML_TOPLEVEL_PATH='/home/iov/.opam/default/lib/toplevel'
export PATH='/home/iov/.opam/default/bin':$PATH

# Mirrors

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


# Proxy
proxy=http://127.0.0.1:1081/
PROXY_ENV="http_proxy https_proxy ftp_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
for v in $PROXY_ENV ; do
  export $v=$proxy
done

export no_proxy="localhost,127.0.0.1,aur.tuna.tsinghua.edu.cn"
