# allows completion for any host in your known_hosts file
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g -e s/"\["//g -e s/"\]".*//g | uniq`;)" ssh
