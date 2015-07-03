#!/bin/bash

gmail_login="login" #login to the email account
gmail_password="pass" #pass to the email account - should be protected !!!

dane="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
--no-check-certificate | grep 'fullcount' \
| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"

if [ -z "$dane" ]; then
echo "No network connection"
else
echo "$dane new e-mail(s)"
fi
