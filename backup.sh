#! /bin/bash
# backup configs

cd ~/links/configs

cp  ~/.tmux.conf ./tmux/
cp  ~/.vimrc ./vim/
cp  ~/.bash_aliases ./shell

cp -r ~/.vim/autoload ./vim/autoloads

