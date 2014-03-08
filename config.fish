set -g -x fish_greeting ''

function yt
  if count $argv >/dev/null
    screen -dm youtube-dl -o "$HOME/Downloads/%(title)s.%(extractor)s.%(id)s.%(ext)s" $argv
  end
  open "$HOME/Downloads"
end

function minecraft
  screen -dm java -d64 -Xms4G -Xmx4G -jar /Applications/Minecraft.app/Contents/Resources/Java/Bootstrap.jar
end

function bu
  if count $argv >/dev/null
    brew upgrade $argv; and brew cleanup -f
  else
    brew update; and brew outdated
  end
end

function rs
  if test -e Procfile.local
    foreman start -f Procfile.local
  else if test -e Procfile.dev
    foreman start -f Procfile.dev
  else
    rails server
  end
end

function rc;  rails console                                     ; end
function rr;  rails runner $argv                                ; end
function rg;  rails generate $argv                              ; end
function gb;  git branch $argv                                  ; end
function gc;  git checkout $argv                                ; end
function gd;  git diff head $argv                               ; end
function gdi; git diff head --ignore-space-change $argv         ; end
function gdt; git difftool head $argv                           ; end
function gg;  git add -A .; and gs                              ; end
function gm;  git commit                                        ; end
function gma; git commit --amend                                ; end
function gpl; git pull --prune                                  ; end
function gps; git push $argv                                    ; end
function gpz; gpl; and gps                                      ; end
function gs;  git status                                        ; end
function l;   ls -F -1 $argv                                    ; end
function la;  ls -F -1 -A $argv                                 ; end
function ll;  ls -F -A -o -h $argv                              ; end
function tm;  tmux attach; or tmux -u                           ; end

set -g -x EDITOR 'vim'
set -g -x PGDATA '/usr/local/var/postgres/'

# homebrew
set -g -x PATH /usr/local/bin /usr/local/sbin $PATH

# rbenv
set -g -x RBENV_ROOT '/usr/local/var/rbenv'
set PATH $RBENV_ROOT/bin $PATH
. (rbenv init -|psub)

set PATH ./bin $PATH
