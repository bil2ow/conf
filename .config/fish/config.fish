set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
set -x PIPENV_PYPI_MIRROR https://pypi.tuna.tsinghua.edu.cn/simple

abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

alias ec "emacsclient -c"
alias paclean "pacman -Qdtq | sudo pacman -Rns -"

alias enable_proxy "set -Ux HTTPS_PROXY http://10.177.3.246:1080;set -Ux HTTP_PROXY  http://10.177.3.246:1080"
alias disable_proxy "set -Ue HTTPS_PROXY;set -Ue HTTP_PROXY"
