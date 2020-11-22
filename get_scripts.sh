#!/bin/bash
#  vs@Duke 20201123
#  load files from github repository and add to home directory
#  wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/
#  run it using
#     wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/get_scripts.sh -O - | bash

# check if wget exist in system
command -v wget >/dev/null 2>&1 || { echo >&2 "$0 require wget but it's not installed.  Aborting."; exit 1; }

wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/screenrc -O ~/.screenrc
wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/bash_aliases -O ~/.bash_aliases
wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/vimrc -O ~/.vimrc

#check if we've appended to .bashrc
#if [ -f ~/.bashrc ] && [ grep Duke ~/.bashrc ]
grep Duke ~/.bashrc  > /dev/null
if [ $? -eq 0 ]
then
    echo "File .bashrc was processd, skiping.."
else
    echo "Appenf to .bashrc"
    wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/bashrc -O - >> ~/.bashrc
fi

echo "Done!"

