abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

alias ec "emacsclient -c"
alias et "emacsclient -t"

alias proxy_off "set -e http_proxy;set -e https_proxy;set -e  ftp_proxy;set -e  all_proxy;set -e  HTTP_PROXY;set -e  HTTPS_PROXY;set -e  FTP_PROXY;set -e  ALL_PROXY"

# copy from ~/.opam/opam-init/variables.fish but delete MANPATH line
set -gx OPAM_SWITCH_PREFIX '/home/iov/.opam/default';
set -gx CAML_LD_LIBRARY_PATH '/usr/lib/ocaml/stublibs:/usr/lib/ocaml';
set -gx CAML_LD_LIBRARY_PATH '/home/iov/.opam/default/lib/stublibs':"$CAML_LD_LIBRARY_PATH";
set -gx OCAML_TOPLEVEL_PATH '/home/iov/.opam/default/lib/toplevel';
set -gx PATH '/home/iov/.opam/default/bin' $PATH;
