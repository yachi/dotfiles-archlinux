#!/bin/sh
[ -d ~/.config/fish ] || mkdir -p ~/.config/fish
ln -svf $(realpath ./config.fish) ~/.config/fish/config.fish

ln -svf $(realpath ./.gitconfig) ~/.gitconfig
