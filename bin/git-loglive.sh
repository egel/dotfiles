#!/bin/sh
while true;
do
    clear
    echo "Git livelog: $(pwd)"
    git log \
    --graph \
    --all \
    --abbrev-commit \
    --date=relative \
    --stat=80 \
    --color \
    -10 \
    --format=format:'%C(bold red)%h%C(reset) %C(bold magenta)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold blue) %an%C(reset)%C(auto)%d%C(reset)' \
    | cat -
    sleep 3
done
