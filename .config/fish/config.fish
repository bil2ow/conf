abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

alias ec "emacsclient -c"
alias et "emacsclient -t"

alias conda_env "eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source"
alias update "sudo pacman -Syu"

alias proxy_off "set -e http_proxy;set -e https_proxy;set -e  ftp_proxy;set -e  all_proxy;set -e  HTTP_PROXY;set -e  HTTPS_PROXY;set -e  FTP_PROXY;set -e  ALL_PROXY"

# kitty + complete setup fish | source

# opam configuration
source /home/iov/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
