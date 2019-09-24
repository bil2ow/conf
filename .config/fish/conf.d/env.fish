# copy from ~/.opam/opam-init/variables.fish but delete MANPATH line
set -gx OPAM_SWITCH_PREFIX '/home/iov/.opam/default';
set -gx CAML_LD_LIBRARY_PATH '/usr/lib/ocaml/stublibs:/usr/lib/ocaml';
set -gx CAML_LD_LIBRARY_PATH '/home/iov/.opam/default/lib/stublibs':"$CAML_LD_LIBRARY_PATH";
set -gx OCAML_TOPLEVEL_PATH '/home/iov/.opam/default/lib/toplevel';
set -gx PATH '/home/iov/.opam/default/bin' $PATH;

# Mirror
set -gx PIPENV_PYPI_MIRROR https://pypi.tuna.tsinghua.edu.cn/simple
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
# set -gx RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup

# Go proxy
set -gx GO111MODULE on
set -gx GOPROXY https://goproxy.io

# Dart pub
set -gx PUB_HOSTED_URL "https://mirrors.tuna.tsinghua.edu.cn/dart-pub/"

# Flutter
set -gx FLUTTER_STORAGE_BASE_URL "https://mirrors.tuna.tsinghua.edu.cn/flutter"

# Proxy
set proxy http://127.0.0.1:7890/
set PROXY_ENV http_proxy all_proxy HTTP_PROXY ALL_PROXY
for v in $PROXY_ENV
  set -gx $v $proxy
end

set -gx no_proxy "localhost,127.0.0.1"
