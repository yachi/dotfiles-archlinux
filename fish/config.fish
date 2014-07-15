# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
# set fish_theme robbyrussell
# set fish_theme (/bin/ls ~/.oh-my-fish/themes/|sort -R|head -n1)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins bundler gi extract

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

# set paths
set PATH ~/.local/bin $PATH
set PATH /opt/android-sdk/platform-tools $PATH

# init z
source ~/github/dotfiles/z-fish/z.fish

# init fry
source /usr/share/fish/fry.fish

# init virtualfish
source ~/github/dotfiles/virtualfish/virtual.fish

# solarized dircolors
eval (dircolors -c /etc/dir_colors | sed 's/env/ -x/')

# alt+. = last argument
function fish_user_key_bindings
    bind \e. 'history-token-search-backward'
end

# powerline shell
function fish_prompt
    python2.7 ~/github/dotfiles/powerline-shell.py $status --shell bare ^/dev/null
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

function adbpush
  set d /sdcard/Download/
  for f in $argv
    echo "pushing $f to $d..."
    adb -d push $f $d
  end
end

# random values
set -x EDITOR vim
set -x USE_CCACHE 1
set -x MAKEFLAGS -j8
set -gx TERM screen-256color

# abbreviations
set -U fish_user_abbreviations 'v=vim'
set fish_user_abbreviations $fish_user_abbreviations 'g=git'
set fish_user_abbreviations $fish_user_abbreviations 'gst=git status'
set fish_user_abbreviations $fish_user_abbreviations 'gd=git diff'
set fish_user_abbreviations $fish_user_abbreviations 'gdc=git diff --cached'
set fish_user_abbreviations $fish_user_abbreviations 'gp=git push'
set fish_user_abbreviations $fish_user_abbreviations 'gc=git commit -v'
set fish_user_abbreviations $fish_user_abbreviations 'gca=git commit -av'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'
set fish_user_abbreviations $fish_user_abbreviations 'gup=git pull --rebase'
set fish_user_abbreviations $fish_user_abbreviations 'gfg=git ls-files|grep'
set fish_user_abbreviations $fish_user_abbreviations 'gf=git flow'
set fish_user_abbreviations $fish_user_abbreviations 'gffs=git flow feature start'
set fish_user_abbreviations $fish_user_abbreviations 'gffp=git flow feature publish'
set fish_user_abbreviations $fish_user_abbreviations 'gffr=git flow feature rebase'
set fish_user_abbreviations $fish_user_abbreviations 'gffr=git flow feature rebase'
set fish_user_abbreviations $fish_user_abbreviations 'sc=systemctl'
set fish_user_abbreviations $fish_user_abbreviations 'ssc=sudo systemctl'

# osx pbcopy
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# git wip
function work_in_progress
  if git log -n 1 | grep -q -c wip; then
    echo "WIP!!"
  end
end
alias gwip='git add -A; git ls-files --deleted -z | xargs -r -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

set fish_user_abbreviations $fish_user_abbreviations 'pie=perl -p -i -e "s###g"'
