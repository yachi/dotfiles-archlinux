FROM logankoester/archlinux

RUN pacman -Syy --noconfirm

RUN pacman -S git fish python2 --noconfirm

RUN useradd test -d /home/test -p test -m

USER test

RUN mkdir /home/test/dotfiles

ADD . /home/test/dotfiles/

ENV HOME /home/test

RUN cd $HOME/dotfiles && ./install.sh
