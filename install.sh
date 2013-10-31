#!/bin/sh
[ -d ~/.config ] || mkdir -p ~/.config
[ -L ~/.config/fish ] || ln -svf $(realpath ./fish) ~/.config/fish

ln -svf $(realpath ./.gitconfig) ~/.gitconfig
