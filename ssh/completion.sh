# allows completion for any host in your known_hosts file
KNOWN_HOSTS=$HOME/.ssh/known_hosts
[[ -f $KNOWN_HOSTS ]] && complete -W "$(echo `cat $KNOWN_HOSTS | cut -f 1 -d ' ' | sed -e s/,.*//g -e s/"\["//g -e s/"\]".*//g | uniq`;)" ssh
