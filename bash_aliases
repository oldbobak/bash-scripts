## vs@Duke 20201123
## https://github.com/oldbobak/bash-scripts
## aliases workaround
## call command with 'command'
# for example run genuine ls instead of aliased version
#  command ls
## List aliases
#  alias
## delete alias
#  unalias mc
## delete all aliases
# unalias -a


# ARCHIVE EXTRACTION
# usage: Unpack <file>
Unpack ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;; 
      *.tar.lrz)   lrzuntar $1  ;;  
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#for some cases better to run mc in ASCII mode
#alias mc="mc -a"

#Systemd/systemctl
alias Status="sudo systemctl status "
alias Start="sudo systemctl start "
alias Stop="sudo systemctl stop "
alias Restart="sudo systemctl restart "
alias Reload="sudo systemctl reload "
alias Daemon-reload="systemctl daemon-reload"
alias Enable="sudo systemctl enable "
alias Disable="sudo systemctl disable "

cat /etc/os-release | grep CentOS 2>&1 > /dev/null
if [ $? -ne 0 ]
then
    # Not CentOS
    alias Install="sudo apt-get install"
    alias Update="sudo apt-get update"
    alias Upgrade="sudo apt-get upgrade"
    alias Search="apt-cache search"
    alias Autoremove="sudo apt-get autoremove"
    alias Autoclean="sudo apt-get autoclean"
    alias Purge="sudo apt-get remove –purge"
else
    # Centos
    # for Yum
    #alias Install="sudo yum install"
    #alias Update="sudo yum update"
    #alias Upgrade="sudo yum upgrade"
    #alias Search="yum  search"
    # for dnf
    alias Install="sudo dnf install"
    alias Update="sudo dnf update"
    alias Upgrade="sudo dnf upgrade"
    alias Search="sudo dnf search"
    alias Remove="sudo dnf remove"
    alias Autoremove="sudo dnf autoremove"
    alias Search="sudo dnf search"
    alias Installed="sudo dnf list installed"
    alias Available="sudo dnf list available"
    alias Provides="sudo dnf provides"
fi

#change dir aliases
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

#File command aliases
alias Ls="ls -p --color=auto --group-directories-first"
alias Top10files="find . -type f -exec ls -sh {} \; | sort -n -r | head -10"
#copy using rsync
alias Rsync="rsync -avv --stats --human-readable --itemize-changes --progress --partial"

#Get local and NATed IPs
alias Localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias Publicip="curl http://ipecho.net/plain; echo"
#TCP/UDP ports 
alias Ports="netstat -tulnp"
alias Pportstcp="netstat -tlnp"
alias Portsudp="netstat -ulnp"
#alias OPorts="netstat -tanp"
# Ping 5 times
alias Ping5='ping -c 5'
alias Ping100='ping -c 100'
#Get HTTP Headers
alias Headers="curl -I"

#System monitoring aliases
alias Mhz='watch -n 1 "cat /proc/cpuinfo | grep MHz"'
alias Mem="free -m -l -t"

alias Cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
alias Pscpu="ps auxf | sort -nr -k 3"
alias Pscpu10="ps auxf | sort -nr -k 3 | head -10"

alias Ram='ps axch -o cmd:15,%mem --sort=-%mem | head'
alias Psmem="ps auxf | sort -nr -k 4"
alias Psmem10="ps auxf | sort -nr -k 4 | head -10"

# Git Aliases
which git 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
  alias Gstat="git status"
  alias Gbra="git branch"
  alias Gcheck="git checkout"
  alias Glog="git log --oneline --decorate --color"
  alias Gla="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) - (%(color:green)%(committerdate:relative)%(color:reset))'"
  alias Gpu="git push --set-upstream origin"
  alias Gamend="git commit --amend"
  alias Gcommit="git commit -m"
  alias Gnuke="git clean -df && git reset --hard"
  alias Gpop="git stash pop"
  alias Gpull="git pull"
  alias Gpush="git push"
  alias Gstash="git stash"
  alias Gadd="git add"
  alias Gdiff="git diff"
  alias Ghidden="! git ls-files -v . | grep ^S | awk '{ print $2 }'" 
fi

#Docker aliases
which docker 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
  alias Deit="docker exec -it"
  alias Di="docker images"
  alias Dil="docker images | sed -n '2p' | awk '{print $3}' | pbcopy"
  alias Dk="docker kill"
  alias Dkl="docker ps | sed -n '2p' | awk '{print $1}' | xargs docker kill"
  alias Dps="docker ps"
  alias Dpsl="docker ps | sed -n '2p' | awk '{print $1}'"
  alias Dritrm="docker run -it --rm"
  alias Drmid="docker rmi $(docker images --filter 'dangling=true' -q --no-trunc)"
  alias Drmif="docker rmi -f"
fi

#Podman aliases
which podman 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
  alias Pps="podman ps"
  alias Plist="podman list -a"
  alias Pstop="podman stop -t 2 --name"
  alias Pimages="podman images"
  alias Psystemd="podman generate systemd --name"
  alias Plog="podman logs"
  alias Ptailf="podman logs -f"
  alias Ptop="podman top"
  alias Pstart="podman start"
  alias Pstartit="podman start --interactive --attach "
  alias Pexec="podman exec -ti"
fi

# Command line head / tail shortcuts
alias H='head'
alias T='tail'
alias G='grep'
alias L="less"

#history search
alias History="history | grep"
# Retry command with sudo
alias Plz='sudo $(fc -ln -1)'
#alias Fuck='sudo $(history -p !!)'
alias Fuck='echo sudo $(history -p !!) && sudo $(history -p !!)'
alias Root='sudo -iu root'

