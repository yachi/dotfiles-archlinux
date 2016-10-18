# set paths
set PATH /usr/local/bin $PATH
set PATH ~/.local/bin $PATH
set PATH /opt/android-sdk/platform-tools $PATH
set PATH /opt/google-cloud-sdk/bin $PATH
set -gx GOPATH $HOME/go
set -gx GOARCH amd64
set -gx GOOS linux
set -gx PATH $GOPATH/bin $PATH

# init z
source ~/.dotfiles/z-fish/z.fish

# init fry
source /usr/share/fish/vendor_conf.d/fry.fish
fry ruby-2.3.1 > /dev/null
fry config auto on > /dev/null

# init virtualfish
source ~/.dotfiles/virtualfish/virtual.fish

# solarized dircolors
# eval (dircolors -c /etc/dir_colors | sed 's/env/ -x/')

# Base16 Shell
eval sh /usr/share/base16-shell/base16-paraiso.dark.sh

# ssh-agent
eval (ssh-agent -c)
ssh-add ~/.ssh/id_rsa

# alt+. = last argument
function fish_user_key_bindings
    bind \e. 'history-token-search-backward'
end

# vim default open dir
function vim
  if count $argv > /dev/null
    env vim $argv
  else
    env vim .
  end
end

function gmd
  git checkout develop; and git fetch --prune; and git rebase; and git branch --merged | grep "\w\+/\w\+"
end

function gmdd
  git branch --merged | grep "\b/\b" | xargs -r git branch -d
end

function gfpp
  begin
    set -lx OVERCOMMIT_DISABLE 1
    for a in {master,develop}
      git checkout $a; and git push
    end; and git push --tags
  end
end

function gfup
  for a in {master,develop}
    git checkout $a; and git pull --ff --ff-only
  end
end

function gff
  begin
    set -lx OVERCOMMIT_DISABLE 1
    git flow finish
  end
end

function goup
  begin
    set -lx OVERCOMMIT_DISABLE 1
    set branch (git rev-parse --abbrev-ref HEAD)
    git checkout qa
    git checkout develop
    git branch -D qa
    git up
    git checkout $branch
  end
end

function gmqa
  set -lx OVERCOMMIT_DISABLE 1
  set branch (git rev-parse --abbrev-ref HEAD)
  goup
  git stash
  git branch -D qa
  git checkout qa
  git merge $branch; and git push; and bundle exec cap staging deploy
end

function adbpush
  set d /sdcard/Download/
  for f in $argv
    echo "pushing $f to $d..."
    adb -d push $f $d
  end
end

function aw
  awk "{print \$$argv}"
end

function bd
  sed -i '/ ap /d' (git status --short|awk '{print $2}')
  sed -i '/ byebug/d' (git status --short|awk '{print $2}')
  sed -i '/ console\.debug/d' (git status --short|awk '{print $2}')
  sed -i '/ console\.log/d' (git status --short|awk '{print $2}')
end

# random values
set -x EDITOR (which wnvim ;or which vim)
set -x USE_CCACHE 1
set -x MAKEFLAGS -j8
set -x CLOUDSDK_PYTHON /usr/bin/python2
set -gx TERM screen-256color

# abbreviations
set -U fish_user_abbreviations 'v=nvim -o'
set fish_user_abbreviations $fish_user_abbreviations 'g=git'
set fish_user_abbreviations $fish_user_abbreviations 'gdf=git dsf'
set fish_user_abbreviations $fish_user_abbreviations 'gst=git status'
set fish_user_abbreviations $fish_user_abbreviations 'gd=git diff'
set fish_user_abbreviations $fish_user_abbreviations 'gdc=git diff --cached'
set fish_user_abbreviations $fish_user_abbreviations 'gp=git push'
set fish_user_abbreviations $fish_user_abbreviations 'gc=git commit -v'
set fish_user_abbreviations $fish_user_abbreviations 'gca=git commit -av'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'
set fish_user_abbreviations $fish_user_abbreviations 'gup=git pull --rebase'
set fish_user_abbreviations $fish_user_abbreviations 'gfg=git ls-files|grep'
set fish_user_abbreviations $fish_user_abbreviations 'gsup=git submodule update --init'
set fish_user_abbreviations $fish_user_abbreviations 'gf=git flow'
set fish_user_abbreviations $fish_user_abbreviations 'gffs=git flow feature start'
set fish_user_abbreviations $fish_user_abbreviations 'gffp=git flow feature publish'
set fish_user_abbreviations $fish_user_abbreviations 'gffr=env OVERCOMMIT_DISABLE=1 git flow feature rebase'
set fish_user_abbreviations $fish_user_abbreviations 'sc=systemctl'
set fish_user_abbreviations $fish_user_abbreviations 'ssc=sudo systemctl'
set fish_user_abbreviations $fish_user_abbreviations 'rrg=rake routes | grep'
set fish_user_abbreviations $fish_user_abbreviations 'dc=docker-compose'
set fish_user_abbreviations $fish_user_abbreviations 'dcl=docker-compose logs'
set fish_user_abbreviations $fish_user_abbreviations 'drw=docker-compose run --rm web'
set fish_user_abbreviations $fish_user_abbreviations 'drws=docker-compose run --rm web bin/spring'
set fish_user_abbreviations $fish_user_abbreviations 'dew=docker-compose exec web'
set fish_user_abbreviations $fish_user_abbreviations 'dewb=docker-compose exec web bundle'
set fish_user_abbreviations $fish_user_abbreviations 'dews=docker-compose exec web bin/spring'
set fish_user_abbreviations $fish_user_abbreviations "dap=sed -i '/ ap /d' (git status --short|awk '{print \$2}')"
set fish_user_abbreviations $fish_user_abbreviations 'le=less -R'
set fish_user_abbreviations $fish_user_abbreviations 'lsd=lynx -stdin -dump'
set fish_user_abbreviations $fish_user_abbreviations 'os=env BUNDLE_GEMFILE=.overcommit_gems.rb bundle exec overcommit --sign'
set fish_user_abbreviations $fish_user_abbreviations 'od=env OVERCOMMIT_DISABLE=1'

# osx pbcopy
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# git wip
function work_in_progress
  if git log -n 1 | grep -q -c wip; then
    echo "WIP!!"
  end
end
function tm
  tmux attach; or tmux
end
function prax_forward
  sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 80 -j REDIRECT --to-ports 20559
end

function drwr
  docker-compose run --rm web bin/spring rspec (git status --short | awk "{print \$2}" | grep -E "^spec/.*_spec.rb")
end

function drwdb
  docker-compose run                   --rm web bash -c 'bundle check || bundle'
  docker-compose run                   --rm web bin/spring rake db:setup
  docker-compose run -e RAILS_ENV=test --rm web bin/spring rake db:setup
end

function gfc
  git status --short | awk "{print \$2}"
end

function fish_prompt
  ~/.dotfiles/powerline-shell.py $status --shell bare ^/dev/null
end

alias gwip='git add -A; git ls-files --deleted -z | xargs -r -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'
alias gdq='git checkout develop; and git branch -D qa'

alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'

alias rm='safe-rm'

set fish_user_abbreviations $fish_user_abbreviations 'pie=perl -p -i -e "s###g"'

# man page with color
set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")
