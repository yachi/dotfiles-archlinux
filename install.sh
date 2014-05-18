#!/bin/sh
[ -d ~/.config ] || mkdir -p ~/.config
[ -L ~/.config/fish ] || ln -svf $(realpath ./fish) ~/.config/fish

ln -svf $(realpath ./.gitconfig) ~/.gitconfig
ln -svf $(realpath ./.gemrc) ~/
ln -svf $(realpath ./.aria2) ~/
ln -svf $(realpath ./.vimrc) ~/

test -d ~/.vim || ln -svf $(realpath ./dotvim) ~/.vim
git submodule update --init --recursive
