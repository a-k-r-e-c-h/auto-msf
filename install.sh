#!/bin/bash


#color-foregground
red='\e[31m'
light_red='\e[1;31m'
green='\e[32m'
light_green='\e[1;32m'
yellow='\e[1;33m'
brown='\e[33m'
blue='\e[34m'
done='\e[0m'

bold='\e[1m'
under_line='\e[4m'
blink='\e[5m'

echo -e "$yellow[i]$done Access$blink$red akrech$done from anywhere on your terminal?$bold Y/N$done"
read -p ":" ans

if [ $ans = Y ] || [ $ans = y ]
then
    chmod +x akrech.sh
    echo -e "$green[+]$done You need root permission..."
    sudo mv akrech.sh /bin/akrech
    echo -e "$blue[#]$done Done!!... now you can access$red akrech$done from anywhere of your terminal"
    echo -e "$yellow[!]$done$bold Happy Hunting$done$yellow[!]$done"
else
    chmod +x akrech.sh
    mv akrech.sh akrech
    echo -e "$green[$]$done Done!!"
    echo -e "$yellow[!]$done$bold Happy Hunting$done$yellow[!]$done"
fi