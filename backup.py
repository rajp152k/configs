#!/bin/python
from pathlib import Path
from shutil import copy
import re

vimrc = Path('~/.vimrc')
bashrc= Path('~/.bashrc')
tmux_conf = Path('~/.tmux.conf')

this = Path().resolve()

copy(tmux_conf,(this'/.tmux.conf'))
copy(vimrc,this'/.vimrc')

with open(bashrc,'r') as bsh:
    bsh
# 
