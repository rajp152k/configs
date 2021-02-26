# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
#if [ -f ~/.bash_aliases ]; then
#	. ~/.bash_aliases
#fi
alias backupRC="bash ~/links/configs/backup.sh"

set -o vi

alias pwsh="powershell.exe"
alias exp="explorer.exe ."

# bash powerline
if [ -f /home/rajp152k/miniconda3/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ];then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /home/rajp152k/miniconda3/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
fi

# WSL 2 GUI settings:
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null
