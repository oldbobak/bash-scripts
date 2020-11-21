# vs@Duke 20200103
#   add this file to .bashrc
# 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

WHOAMI=`whoami`
if [  "root"  = ${WHOAMI} ]
then
    #root prompt
    PS1='\[\e[1;35m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[1;35m\]\$ \[\e[m\]\[\e[1;37m\]'
else
    PS1='\[\e[0;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[0;37m\]'
fi
