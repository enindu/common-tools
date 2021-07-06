#!/bin/bash

# Dependencies: curl
#               tor

if [[ $EUID -gt 0 ]]
then
    echo "Error: Please run this script as root"
    exit
fi

if [[ -z $1 ]] || [[ -z $2 ]] || [[ -z $3 ]]
then
    echo "Usage:   sh send-request.sh <url> <host> <referer>"
    echo "Example: sh send-request.sh https://enindu.com enindu.com https://www.google.lk"
    exit
fi

while :
do
    systemctl restart tor.service
    ip=$(curl --socks5-hostname 127.0.0.1:9050 -s icanhazip.com)
    curl \
        --socks5-hostname 127.0.0.1:9050 \
        --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0" \
        -s \
        -o /dev/null \
        -w "Output: %{response_code} | %{url} | $ip\n" \
        -H "Accept: */*" \
        -H "Accept-Encoding: gzip, deflate, br" \
        -H "Accept-Language: en-GB" \
        -H "Cache-Control: no-cache" \
        -H "Connection: keep-alive" \
        -H "DNT: 1" \
        -H "Host: $2" \
        -H "Pragma: no-cache" \
        -H "Referer: $3" \
        $1
    sleep 1
done
