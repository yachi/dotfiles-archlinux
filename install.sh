#!/bin/sh
[ -d ~/.config ] || mkdir -p ~/.config
[ -L ~/.config/fish ] || ln -svf $(realpath ./fish) ~/.config/fish

ln -svf $(realpath ./.gitconfig) ~/.gitconfig
ln -svf $(realpath ./.gitignore) ~/.gitignore
ln -svf $(realpath ./.gemrc) ~/
ln -svf $(realpath ./.aria2) ~/
ln -svf $(realpath ./.vimrc) ~/

test -d ~/.vim || ln -svf $(realpath ./dotvim/) ~/.vim/
git submodule update --init --recursive

yaourt -S base-devel \
  fish \
  python \
  python2 \
  safe-rm \
  fry \
  --noconfirm
