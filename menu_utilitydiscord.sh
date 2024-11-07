#!/bin/bash

clear

cat << "textASCII"
 ____  _                       _   _   _ _   _ _ _ _         
|  _ \(_)___  ___ ___  _ __ __| | | | | | |_(_) (_) |_ _   _ 
| | | | / __|/ __/ _ \| '__/ _` | | | | | __| | | | __| | | |
| |_| | \__ \ (_| (_) | | | (_| | | |_| | |_| | | | |_| |_| |
|____/|_|___/\___\___/|_| _\__,_|  \___/ \__|_|_|_|\__|\__, |
   / \   _ __ ___| |__   | |   (_)_ __  _   ___  __    |___/ 
  / _ \ | '__/ __| '_ \  | |   | | '_ \| | | \ \/ /          
 / ___ \| | | (__| | | | | |___| | | | | |_| |>  <           
/_/   \_\_|  \___|_| |_| |_____|_|_| |_|\__,_/_/\_\  by Iv4nTech   
textASCII

echo -e "\nIntroduce el numero para ejecutar la opción: "

echo -e "\n 1 - Discord Fake Update: Se engaña modificando un archivo, para que te deje usarlo sin actualizarlo"
echo " 2 - Actualizar Discord: Se actualiza Discord a la última versión disponible"

echo -ne "\n Eliges la opción: " 
read opcion


case $opcion in

  1)
    ./mini-programas/fakeupdate_discord.sh
    ;;

  2)
    pacman -Sy discord
    ;;

  PATTERN_N)
    STATEMENTS
    ;;

  *)
    STATEMENTS
    ;;
esac
