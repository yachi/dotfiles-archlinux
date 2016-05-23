#!/bin/bash
[ -d ~/.config  ] || mkdir -p ~/.config
[ -L ~/.config/omf  ] || ln -svf $(realpath ./omf)/ ~/.config/omf/

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

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
  postgresql \
  fry \
  safe-rm \
  gitflow-avh \
  --noconfirm
