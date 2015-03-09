alias aktualizuj='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get update && sudo apt-get dist-upgrade'
alias zamknij-teraz='sudo shutdown -h now'
alias zamknij='sudo su && shutdown -m'

alias rm="rm -v"
alias mv="mv -i"
alias cp="cp -i"
alias du="du -c"
alias grep="egrep -i"
alias l='ls'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'

alias cd..='cd ..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias show-gitsubmodules="git submodule status | cut -d' ' -f3-4"
alias show-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons true'
alias hide-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias fix_public_html='sudo adduser $USER www-data && sudo chown -R www-data:www-data /home/$USER/public_html && sudo find /home/$USER/public_html -type d -exec chmod 775 {} \; && sudo find /home/$USER/public_html -type f -exec chmod 664 {} \;'
