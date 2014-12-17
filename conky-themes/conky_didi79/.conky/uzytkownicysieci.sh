#!/bin/bash
if [ -e ~/.list ]; then
nbtscan 10.0.0.2-10 > .list
else 
touch ~/.list 
nbtscan 10.0.0.2-10 > .list
fi

if [ -e ~/.ile ]; then
wc -l ~/.list > ~/.ile
else
touch ~/.ile
wc -l ~/.list > ~/.ile
fi
wynik="$[$(cat ~/.ile | cut -c1)-4]"
cat ~/.list | tail -n$wynik | cut -d" " -f1-13
