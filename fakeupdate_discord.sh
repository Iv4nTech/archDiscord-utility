#!/bin/bash 

cd /tmp

wget --server-response --spider -o wget-log https://discord.com/api/download?platform=linux&format=deb > /dev/null 2>&1

sleep 4 & pid=$!; sleep 1; kill $pid
pkill Discord

version=$(cat -n wget-log | fold -w 150 | grep 'location' | cut -d '/' -f6)

sudo sed -i "3s/.*/  \"version\": \"$version\"/" /opt/discord/resources/build_info.json 2>/dev/null
codigoError=$?
clear

if [ -z "$version" ]; then
     echo -e "\033[0;31mERROR[192]: Please connect to the internet!\033[0m"
     exit 192
fi

if [ "$codigoError" = "0" ]; then
    echo -e "\033[0;32mDiscord is already updated!\033[0m"
    sleep 3
else
    echo -e "\033[0;31mERROR[2]: /opt/discord/resources/build_info.json file does not exist!\033[0m"
    exit 2
fi

clear

rm /tmp/wget-log

echo "Do you want to open Discord? (Y/n)"
read openDiscord

openDiscord=${openDiscord:-Y}

clear

if [ "$openDiscord" = 'Y' ]; then 
    echo " "
    echo -e "\033[0;32mStarting Discord...\033[0m"
    echo " "
    discord > /dev/null 2>&1 &
else 
    echo " "
    echo -e "\033[0;33mYou chose not to open Discord\033[0m"
    echo " "
fi




