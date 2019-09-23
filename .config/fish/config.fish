abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

alias ec "emacsclient -c"
alias et "emacsclient -t"
alias en_anaconda "source /opt/anaconda/bin/activate root"
alias de_anaconda "source /opt/anaconda/bin/deactivate root"

alias proxy_off "set -e http_proxy;set -e https_proxy;set -e  ftp_proxy;set -e  all_proxy;set -e  HTTP_PROXY;set -e  HTTPS_PROXY;set -e  FTP_PROXY;set -e  ALL_PROXY"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

