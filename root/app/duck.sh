#!/usr/bin/with-contenv bash

. /app/duck.conf
IP=$(wget -qO- "http://myexternalip.com/raw")
IPV6=$(wget -q --output-document - http://checkipv6.dyndns.com/ | grep -o "[0-9a-f\:]\{8,\}")
RESPONSE=`curl -s "https://www.duckdns.org/update?domains=$SUBDOMAINS&token=$TOKEN&ip=$IP&ipv6=$IPV6"`
if [ "$RESPONSE" = "OK" ]; then
echo "Your IP was updated at "$(date)
else
echo "Something went wrong, please check your settings  "$(date)
fi
