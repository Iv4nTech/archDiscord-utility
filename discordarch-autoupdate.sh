#!/bin/bash 

cd /tmp

wget --server-response --spider -o wget-log https://discord.com/api/download?platform=linux&format=deb > /dev/null 2>&1

sleep 4 & pid=$!; sleep 1; kill $pid

pkill Discord

version=$(cat -n wget-log | fold -w 150 | grep 'location' | cut -d '/' -f6)

sudo sed -i "3s/.*/  \"version\": \"$version\"/" /opt/discord/resources/build_info.json 2>/dev/null


if [ $? -eq 0 ]; then
    echo -e "\033[0;32mYou already have Discord updated, it's ready to use!\033[0m"
else
    echo -e "\033[0;31mERROR: If you can't resolve this, please open an issues on GitHub\033[0m"
fi


rm /tmp/wget-log