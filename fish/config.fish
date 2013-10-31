# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
# set fish_theme robbyrussell
# set fish_theme (/bin/ls ~/.oh-my-fish/themes/|sort -R|head -n1)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins bundler gi rbenv

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# init rbenv
. (rbenv init -|psub)

# solarized dircolors
eval (dircolors -c /etc/dir_colors | sed 's/env/ -x/')

# alt+. = last argument
function fish_user_key_bindings
    bind \e. 'history-token-search-backward'
end
function fish_prompt
    python2.7 ~/.powerline-shell.py $status --shell bare ^/dev/null
end

. ~/.config/fish/functions/git.fish
git_aliases
