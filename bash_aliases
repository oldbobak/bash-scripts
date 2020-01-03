## vs@Duke 20200103
## Обход алиасов
## Вызывать с command
#  command ls
## Просмотр
#  alias
## Удаление с помощью unalias. Например:
#  unalias mc
##или же удалить вообще все псевдонимы, если нужно:
# unalias -a


#alias mc="mc -a"
#Systemd/systemctl
alias Status="sudo systemctl status "
alias Start="sudo systemctl start "
alias Stop="sudo systemctl stop "
alias Restart="sudo systemctl restart "
alias Reload="sudo systemctl reload "

alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

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
    alias Install="sudo yum install"
    alias Update="sudo yum update"
    alias Upgrade="sudo yum upgrade"
    alias Search="yum  search"
    #alias Autoremove="sudo apt-get autoremove"
    #alias Autoclean="sudo apt-get autoclean"
    #alias Purge="sudo apt-get remove –purge"
fi
alias top10files="find . -type f -exec ls -sh {} \; | sort -n -r | head -10"

#Получить заголовки сервера:
alias Header="curl -I"

#посмотреть локальные адреса
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias Myip="curl http://ipecho.net/plain; echo"

#Копировать через rsync
alias Copy="rsync -avv --stats --human-readable --itemize-changes --progress --partial"

#Использование памяти:
alias meminfo="free -m -l -t"
#Показать процессы потребляющие больше всего памяти:
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"
#Показать процессы использующие процессор:
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

#Поиск в истории
alias histg="history | grep"

#контроль открытых портов
alias Ports="netstat -tulnp"
alias TPports="netstat -tlnp"
alias UPorts="netstat -ulnp"
alias OPorts="netstat -tanp"

