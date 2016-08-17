#!/usr/bin/env bash
set -e

app_fqdn=`cf app $MUSIC_APP_NAME | awk '/urls: / {print $2}'`
get_code="curl -k -I $app_fqdn 2>/dev/null | head -n 1 | cut -d$' ' -f2"
status_code=`eval $get_code`
if [ "$status_code" != "200" ]
then
  echo "Expect status code from $app_fqdn as 200, but got $status_code"
  exit 1
fi
