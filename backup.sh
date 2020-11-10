#! /bin/bash
# backup configs

cd ~/links/configs

cp -f ~/.tmux.conf .
cp -f ~/.vimrc .
cp -f ~/.bash_aliases .

git add .
git commit -m "update"
git push
