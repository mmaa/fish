set -g -x fish_greeting ''

function bu;  brew update; and brew outdated    ; end
function gb;  git branch $argv                  ; end
function gc;  git checkout $argv                ; end
function gd;  git diff head $argv               ; end
function gdi; gd --ignore-space-change $argv    ; end
function gdt; git difftool head $argv           ; end
function gg;  git add .; and git add -u; and gs ; end
function gm;  git commit $argv                  ; end
function gmm; git commit -m $argv               ; end
function gpl; git pull --prune                  ; end
function gps; git push $argv                    ; end
function gpz; gpl; and gps                      ; end
function gs;  git status                        ; end
function l;   ls -F -1 $argv                    ; end
function la;  ls -F -1 -A $argv                 ; end
function ll;  ls -F -A -o -h $argv              ; end
function tm;  tmux attach; or tmux -u           ; end

set -g -x EDITOR 'vim'
set -g -x PAGER 'vimpager'
set -g -x PGDATA '/usr/local/var/postgres/'

set -g -x PATH /usr/local/bin /usr/local/sbin $PATH

set -g -x RBENV_ROOT '/usr/local/var/rbenv'
set PATH $RBENV_ROOT/bin $PATH
set PATH $RBENV_ROOT/shims $PATH
rbenv rehash >/dev/null ^&1
