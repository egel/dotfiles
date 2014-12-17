#!/bin/bash

gmail_login="login" #login do skrzyki
gmail_password="pass" #haslo do konta

dane="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
--no-check-certificate | grep 'fullcount' \
| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"

if [ -z "$dane" ]; then
echo "Brak polaczenia"
else
echo "Masz: $dane list(ów)"
fi
