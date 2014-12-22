alias aktualizuj='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get update && sudo apt-get dist-upgrade'
alias zamknij='sudo shutdown -h now'
alias zamknij_za_minut='sudo su && shutdown -m'
alias instaluj='sudo apt-get install'

alias ..='cd ..'
alias show-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons true'
alias hide-desktop-icons='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias fix_public_html='sudo adduser $USER www-data && sudo chown -R www-data:www-data /home/$USER/public_html && sudo find /home/$USER/public_html -type d -exec chmod 775 {} \; && sudo find /home/$USER/public_html -type f -exec chmod 664 {} \;'
