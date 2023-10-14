#!/bin/bash
htbip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

if [[ $htbip == *"10."* ]]
then
   echo -e "─[\e[36m$htbip\e[32m]"
else
   echo ""
fi

