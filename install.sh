#!/bin/sh
[ -d ~/.config ] || mkdir -p ~/.config
[ -L ~/.config/fish ] || ln -svf $(realpath ./fish) ~/.config/fish

ln -svf $(realpath ./.gitconfig) ~/.gitconfig
ln -svf $(realpath ./.gemrc) ~/
ln -svf $(realpath ./.janus) ~/
ln -svf $(realpath ./.janus/.vimrc.after) ~/
ln -svf $(realpath ./.janus/.vimrc.before) ~/
ln -svf $(realpath ./powerline-shell.py) ~/.powerline-shell.py
