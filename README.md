# bash-scripts
Simple bash scripts for initial server setup

Get additional configuration in next files:

  .bash_aliases
  
  .bashrc
  
  .screenrc
  
  .vimrc

cat > updatescripts.sh << EOT

#!/bin/bash

wget https://raw.githubusercontent.com/oldbobak/bash-scripts/master/runme.sh -O - | bash

EOT 
