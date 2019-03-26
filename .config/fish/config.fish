set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
set -x PIPENV_PYPI_MIRROR https://pypi.tuna.tsinghua.edu.cn/simple

abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

alias ec "emacsclient -nw"
alias paclean "pacman -Qdtq | sudo pacman -Rns -"
