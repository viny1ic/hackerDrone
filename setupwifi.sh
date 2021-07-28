#!/bin/bash
echo "installing wifi attack tools"
sudo apt install aircrack-ng -y
echo "do you want to install wordlist 'rockyou.txt?' (Y/N)"
read wl
if [ $wl == "Y" ]; then
   wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
else
   echo Enter Path Of Your Custom Wordlist.
   read wordlist
fi
cp $wordlist .